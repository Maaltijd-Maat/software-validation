# Software Validation Docker-Compose
This repo contains the docker-compose.yml for our software validation project. The docker-compose file will install Jenkins with the blue ocean plugin. Blue ocean allows users to graphically create, visualize and diagnose Continuous Delivery (CD) Pipelines.

## Pre-requisitions
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation
### Configure Docker containers
1.  Clone the repo to your pc.
2.  Open the folder in your terminal or cmd.
3.  Execute: `$  docker-compose up -d` to create a new docker container.

### Configure SonarQube
1.  Open SonarQube at [localhost:9000](http://localhost:9000).
2.  Login with: username: `admin` and password: `admin`
3.  Set a new password.
4.  Go to [localhost:9000/account/security/](http://localhost:9000/account/security/) and generate a new token. **Store this token somewhere, you need it later!**
5.  Go to [localhost:9000/admin/webhooks](http://localhost:9000/admin/webhooks) and create a new webhook with the name: `Jenkins` and url: `http://jenkins:8080/sonarqube-webhook`

### Configure Jenkins
1.  Open jenkins in your browser at [localhost:8080](http://localhost:8080) and follow the installation instructions.<br>Install the suggested plugins.
2.  Go to [localhost:8080/configure](http://localhost:8080/configure) and head to the SonarQube Servers section.
3.  Add a new server with the following settings: check the Environment variables, Name: `Default`, Server: `http://sonarqube:9000`.
4.  Press 'Add a new Jenkins Server authentication token'.
5.  Set kind to: 'Secret Text' and paste the generated SonarQube token in the secret field. Press add.
6.  Save the Jenkins configuration.
7. Go to the Blue Ocean plugin by navigating to [http://localhost:8080/blue](http://localhost:8080/blue) or pressing the "Open Blue Ocean" entry in the sidebar.
8. Press "New Pipeline" and follow the instructions to add the desired repo to Jenkins (https://github.com/Maaltijd-Maat/umlet).

## Known Issues
### Mounts Denied upon creating /root/.m2 (MacOs)
To fix the mounts denied error:
Go to Docker -> settings -> Resources -> File Sharing and add '/root/.m2'.