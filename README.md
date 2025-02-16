# React-Application DevOps Project 

##Overview

This project is a complete DevOps pipeline implementation, covering application deployment, containerization, CI/CD automation, and monitoring using open-source tools. The goal is to deploy a web application, automate the build and deployment process, and set up a monitoring system to ensure application health.

Technologies Used

Application: Deployed on port 800

Docker: Containerized the application using a Dockerfile

Docker Compose: Manages the application’s containers

Bash Scripting: Automates build and deployment processes

Git & GitHub: Version control with a structured branching strategy

Jenkins: Automates the CI/CD pipeline

Docker Hub: Hosts images for different environments (public & private repos)

AWS EC2: Hosts the deployed application

Security Groups: Restricts access to authorized IPs

Monitoring: Ensures application uptime and health status

Project Setup & Execution

1. Application Deployment

The application code was refered from:

git clone https://github.com/sriram-R-krishnan/devops-build.git

Run the application on port 800

2. Containerization

Create a Dockerfile to containerize the application

Write a docker-compose.yml file to manage multi-container setups

3. Automation with Bash Scripts

build.sh: Builds the Docker image

deploy.sh: Deploys the image to the server

4. CI/CD with Jenkins

Configured Jenkins to:

Build, push, and deploy images automatically

Trigger builds on dev and master branches

Push to dev (public) and prod (private) Docker Hub repos

5. AWS Setup & Security

Launched a t2.micro EC2 instance

Configured Security Groups:

Application Access: Open for all users

Server Login: Restricted to my public IP only

6. Monitoring & Alerts

Integrated an open-source monitoring system to track the application health

Configured notifications to alert in case of downtime

Activity Log

Throughout this project, I documented each step with screenshots to showcase the process, including:

Jenkins configuration & build steps

AWS EC2 setup & security group configurations

Docker Hub repositories with image tags

Deployed application page

Monitoring dashboard with health status

These images provide a detailed view of the entire pipeline and the automation processes implemented.

This project demonstrates a fully automated CI/CD pipeline, security best practices, and monitoring implementation, ensuring a scalable and maintainable DevOps workflow.

## Troubleshooting:
During the development of this project, several errors and challenges arose. The following points may be helpful for others facing similar issues:

Handling Prebuilt Artifacts:
This project was unique because the source code repository already contained the build artifacts along with the source code. As a result, rebuilding the application was unnecessary. Instead, moving the artifact to the Nginx directory (/usr/share/nginx/html/) was sufficient to start the application.


Managing Storage Issues:
A common mistake, which I believe many encounter, is creating an instance with insufficient storage. This often leads to storage-related errors midway through the project. To avoid this:
Plan in advance by considering all the software you intend to install and allocate sufficient storage accordingly.
Use the command " docker image prune -f " to remove unused Docker images.
If necessary, delete stopped containers to free up space. With the help of an AI tool, I found the following useful command:
" sh 'docker ps -aq | xargs -r docker rm -f' "
This command removes all stopped containers, helping reclaim storage space.


Branch-Based Docker Image Deployment:
One requirement of this project was to ensure that:
When code is pushed to the dev branch, a Docker image is built and pushed to the dev repository on Docker Hub.
When dev is merged into master, the Docker image is pushed to the production repository on Docker Hub.
Initially, I attempted to use the condition "env.BRANCH == 'origin/dev'" in the Jenkins pipeline, but it did not work as expected. After debugging, I found that "env.GIT_BRANCH == 'origin/dev'" was the correct approach for handling Git branches in Jenkins.


Securely Managing DockerHub Credentials:
Since the project required pushing Docker images to Docker Hub, authentication was necessary. Initially, I stored the DockerHub password directly in the Jenkinsfile, which was insecure—especially since the project repository was public. To solve this, I utilized Jenkins credentials to securely store and use the DockerHub password without exposing it in the repository.


Throughout the project, I encountered a few other minor issues, but they were not significant enough to document here.

## Optional Configuration:
If you need SonarQube code quality check you can use the SonarQube analysis stage and setup/configure SonarQube in the server. 

## Note
This repository contains two branches "main" & "dev", main branch contains the project commands and configuration and dev branch conntains the configuration files.

## Contributors
- Danush Vithiyarth Jaiganesh - DevOps Engineer
