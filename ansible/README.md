# Whats is Ansible?

Ansible is a software tool that provides simple but powerful automation for cross-platform computer support. It is primarily intended for IT professionals, who use it for application deployment, updates on workstations and servers, cloud provisioning, configuration management, intra-service orchestration, and nearly anything a systems administrator does on a weekly or daily basis. Ansible doesn't depend on agent software and has no additional security infrastructure, so it's easy to deploy.

# How to setup?

    - python3 -m venv venv
    - source venv/bin/activate
    - pip install -U pip
    - pip install -r requirements.txt
    - ansible --version 

Note: Open inventory.ini file and copy the "EC2 instance public-ip" into metioned part.

# How to deploy?

    - ansible-playbook -i inventory.ini install_docker.yaml
