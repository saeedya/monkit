# monkit

Monkit is a simple "python" web application with the "FastAPI" web framework.This application
have the following endpoints:

/: shows index page that shows a simple text “Welcome to our application”

/status: shows application metrics which shows JSON output like below:

    {
        "status":"up",
        "active_connections":4,
        "ip_address":"10.10.2.83",
        "memory_total":0.07918930053710938,
        "cpu_total":100.0,
        "current_datetime":"2022-09-27T12:11:44"
    }

# Requirements:
    - python3
    - FastAPI Framework
    - Debian base OS - Tested on ubuntu 22.04

# How to setup the application?

    - git clone https://github.com/saeedya/monkit.git
    - python3 -m venv venv
    - source venv/bin/activate
    - pip install -U pip
    - pip install -r requirements.txt

# How to run the application?

    #uvicorn "monkit.main:app" --reload

    Now open abrowser and launch("/" and "/status")

        - http://localhost:8000
        - http://localhost:8000/status

# How to run with container?

    Find the "Makefile" file and run:
        - make biuld    (It will build monkit:latest image)
    
    Now run below command:
        - docker run -itd --name monkit -p 8000:8000 monkit:latest

#

All the above will run on your Desktop machine or laptop. So there will be 3 different
parts listed below for deploying on an AWS EC2 instace:

    1- "Terraform README.md" - Whit an IaC code in Terraform creating an EC2 instance “t2.micro” 
        along with all related services like VPC, Subnet, Route, Internet Gateway, EBS, EC2,
        Keypair, and etc.
    
    2- "Ansible README.md" - After bringing up the instance, Ansible should take it, upgrade the
       instance and install Docker and Docker-compose on that instance.

    3- "Terraform README.md" - At this point, Terraform should take the control again and deploy 
       the following services in the right order. Write a Terraform code to do the following works:

        a. Deploy a Docker registry into the EC2 machine (Docker)
        b. Push the application image into that registry
        c. Create a container of the application and publish its port

    Directories : Terraform and Ansible