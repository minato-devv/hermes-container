#!/bin/bash

set -euo pipefail

container build -t local/ubuntu-machine:latest -f Containerfile .
container machine create local/ubuntu-machine:latest --name hermes-agent --home-mount=none
container machine set -n hermes-agent cpus=2 memory=4G
container machine stop hermes-agent
container machine set-default hermes-agent
container machine run -- bash -c "curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash"
