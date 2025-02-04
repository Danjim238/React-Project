DevOps Project

Overview

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

## Note
This repository contains two branches "main" & "dev", main branch contains the activity commands and configuration and dev branch conntains the configuration files.

## Contributors
- Danush Vithiyarth Jaiganesh - DevOps Engineer




