# Aptos Project

> *Aptos Project* — clean, modular starter for building, testing, and deploying Move smart contracts and a companion web frontend on the Aptos blockchain.

---

## Table of Contents

* [About](#about)
* [Features](#features)
* [Prerequisites](#prerequisites)
* [Repository Structure](#repository-structure)
* [Local Development](#local-development)

  * [Install dependencies](#install-dependencies)
  * [Run a local Aptos node (devnet)](#run-a-local-aptos-node-devnet)
  * [Compile & publish Move modules](#compile--publish-move-modules)
  * [Frontend development](#frontend-development)
* [Testing](#testing)
* [Deployment](#deployment)
* [Security & Best Practices](#security--best-practices)
* [Contributing](#contributing)
* [License](#license)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)

---

## About

This repository is a starter template for building blockchain dApps on Aptos. It demonstrates:

* Writing Move smart contracts (modules) for on-chain logic.
* Compiling & publishing Move modules using the Aptos CLI.
* A modern JavaScript/TypeScript frontend (React) that interacts with the Aptos network via wallet adapters.
* Local development workflow (local devnet or testnet) and automated tests.

Use this README to get the project running locally and to learn how to extend or deploy the app.

## Features

* Move smart contract examples (token, simple registry, access control)
* CLI scripts to compile and publish Move packages
* Frontend using React + aptos wallet adapter
* Environment-based configuration for dev/test/mainnet
* Unit & integration tests for Move modules and frontend

## Prerequisites

Make sure you have the following installed:

* Node.js (v16+ recommended)
* npm or yarn
* Rust and Cargo (if you plan to work with any Rust tools)
* Aptos CLI (*install and configure before compiling/publishing Move packages*)
* (Optional) Docker, if you prefer to run a local Aptos node within a container

> Note: If you don't have the Aptos CLI already, install it from the official Aptos docs and add it to your PATH.

## Repository Structure


/ (root)
├─ /move                # Move packages / on-chain modules
│  ├─ Move.toml
│  └─ sources/
├─ /frontend            # React app that interacts with Aptos
│  ├─ package.json
│  └─ src/
├─ /scripts             # Helper scripts (deploy, test, utils)
├─ /tests               # Automated tests
├─ README.md            # <-- this file
└─ .env.example


## Local Development

### Install dependencies

From project root:

bash
# frontend deps
cd frontend
npm install
# or
# yarn install


### Run a local Aptos node (devnet)

You can either:

* Use a remote Aptos testnet (recommended for quick experiments)
* Run a local devnet using the Aptos CLI or Docker. Typical local-flow:

bash
# start a local Aptos node (example - adapt if using Docker or other scripts)
# (This is an illustrative command — consult your local dev script or Aptos docs)
./scripts/start-local-devnet.sh


### Compile & publish Move modules

Compile the Move package(s):

bash
cd move
aptos move compile --package-dir .


To publish to a network (local devnet or testnet), configure your Aptos CLI profile and run:

bash
# set profile to local or testnet
aptos config set --profile local --url <NODE_URL>
# create or use an existing account (example)
aptos account create --profile local
# publish the package
aptos move publish --package-dir . --profile local


> Replace local and <NODE_URL> with the profile name and RPC URL for your target network.

### Frontend development

Set up environment variables (copy .env.example to .env and update values such as RPC URL and wallet connector).

Run the frontend in dev mode:

bash
cd frontend
npm run dev
# or
# npm start


Open http://localhost:3000 (or the port shown in the console) and connect a wallet (Aptos wallet adapter / Martian / Petra / etc.).

## Testing

### Move tests

If there are Move unit tests in the move package, run:

bash
cd move
aptos move test --package-dir . --profile local


### JavaScript/TypeScript tests

From the frontend or tests folder:

bash
npm run test


## Deployment

1. Configure the Aptos CLI to point at the desired network (testnet or mainnet).
2. Ensure the publishing account has enough funds.
3. Run the aptos move publish command with the correct profile.

Optionally, run CI scripts to publish, build frontends, and create releases.

## Security & Best Practices

* Audit Move modules carefully before publishing to mainnet.
* Use testnet/local devnet extensively to test upgradeability and migrations.
* Keep private keys and mnemonics out of the repository — use environment variables or secret stores.
* Pin package versions where appropriate and run security checks on dependencies.

## Contributing

Contributions are welcome!

1. Fork the repo
2. Create a feature branch: git checkout -b feat/my-feature
3. Commit your changes: git commit -m "feat: add ..."
4. Open a Pull Request and describe your changes

Please follow the code style used in the repository and add tests for new features.

## License

This project is released under the MIT License. See LICENSE for details.

## Acknowledgements

* The Aptos community and documentation
* Open-source libraries and wallet adapters used in the project

## Contact

If you have questions or need help, open an issue or contact the maintainer.

---
## Transation Hash: 0x6821e154cdb23c9bcf144f58c576b1593ca6f43a7ff8df4ed5bc965e96db1cc0
<img width="957" height="446" alt="image" src="https://github.com/user-attachments/assets/5cab0122-c806-4129-a0ee-3a0a379692be" />

Happy building on Aptos!
