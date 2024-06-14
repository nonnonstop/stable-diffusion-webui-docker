# Stable Diffusion web UI - Docker

## Requirement

* Docker (docker-ce)
* NVIDIA Container Toolkit (nvidia-docker2)

Tested on Ubuntu 22.04 on WSL2.

## Installation

1. Create docker-compose.override.yml for overriding settings

   ```yaml
   services:
     nvidia:
       build:
         args:
           UID: "1000"
       user: "1000:1000"
       volumes:
         - /mnt/c/sd_webui_data:/webui/repo/data
         - /mnt/c/sd_webui_output:/webui/repo/outputs
   ```

2. Build image

       docker compose build --build-arg COMMIT=master

## Usage

1. Run WebUI

       docker compose up

2. Access to http://localhost:7860
