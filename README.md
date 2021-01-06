# Software Validation Docker-Compose
This repo contains the docker-compose.yml for our software validation project. The docker-compose file will install Jenkins with the blue ocean plugin. Blue ocean allows users to graphically create, visualize and diagnose Continuous Delivery (CD) Pipelines.

## Pre-requisitions
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation
1.  Clone the repo to your pc.
2.  Open the folder in your terminal or cmd.
3.  Execute: `$  docker-compose up -d` to create a new docker container.
4.  Open jenkins in your browser at [localhost:8080](http://localhost:8080) and follow the installation instructions.<br>Install the suggested plugins.

## Configuring
1. Go to the Blue Ocean plugin by navigating to [http://localhost:8080/blue](http://localhost:8080/blue) or pressing the "Open Blue Ocean" entry in the sidebar.
2. Press "New Pipeline" and follow the instructions to add the desired repo to Jenkins.

## Known Issues
### Mounts Denied upon creating /root/.m2 (MacOs)
To fix the mounts denied error:
Go to Docker -> settings -> Resources -> File Sharing and add '/root/.m2'.