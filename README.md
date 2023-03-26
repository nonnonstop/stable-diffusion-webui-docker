# Stable Diffusion web UI - Docker

## Requirement

* Docker (docker-ce)
* NVIDIA Container Toolkit (nvidia-docker2)

Tested on Ubuntu 22.04 on WSL2.

## Installation

1. Build image

       docker compose -f docker-compose.yml -f docker-compose.install.yml build --build-arg WEBUI_BRANCH=master

2. Install dependencies

       docker compose -f docker-compose.yml -f docker-compose.install.yml up

## Usage

1. Run WebUI

       docker compose up

2. Access to http://localhost:7860
