module MyModule::Crowdfunding {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a crowdfunding project
    struct Project has store, key {
        total_funds: u64,  // Total tokens raised for the project
        goal: u64,         // Funding goal of the project
        creator: address,  // Address of the project creator
        is_active: bool,   // Whether the project is still accepting funds
    }

    /// Error codes
    const E_PROJECT_NOT_FOUND: u64 = 1;
    const E_PROJECT_INACTIVE: u64 = 2;
    const E_INVALID_AMOUNT: u64 = 3;
    const E_GOAL_REACHED: u64 = 4;

    /// Function to create a new crowdfunding project with a funding goal
    public fun create_project(owner: &signer, goal: u64) {
        assert!(goal > 0, E_INVALID_AMOUNT);
        
        let owner_addr = signer::address_of(owner);
        let project = Project {
            total_funds: 0,
            goal,
            creator: owner_addr,
            is_active: true,
        };
        
        move_to(owner, project);
    }

    /// Function for users to contribute tokens to a project
    public fun contribute_to_project(
        contributor: &signer, 
        project_owner: address, 
        amount: u64
    ) acquires Project {
        assert!(amount > 0, E_INVALID_AMOUNT);
        assert!(exists<Project>(project_owner), E_PROJECT_NOT_FOUND);
        
        let project = borrow_global_mut<Project>(project_owner);
        assert!(project.is_active, E_PROJECT_INACTIVE);
        assert!(project.total_funds < project.goal, E_GOAL_REACHED);
        
        // Transfer contribution from contributor to project owner
        let contribution = coin::withdraw<AptosCoin>(contributor, amount);
        coin::deposit<AptosCoin>(project_owner, contribution);
        
        // Update total funds raised
        project.total_funds = project.total_funds + amount;
        
        // Check if goal is reached and deactivate project
        if (project.total_funds >= project.goal) {
            project.is_active = false;
        };
    }

    /// View function to get project details
    #[view]
    public fun get_project_info(project_owner: address): (u64, u64, bool) acquires Project {
        assert!(exists<Project>(project_owner), E_PROJECT_NOT_FOUND);
        let project = borrow_global<Project>(project_owner);
        (project.total_funds, project.goal, project.is_active)
    }
}