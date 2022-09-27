# What is Terraform?

HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem
resources in human-readable configuration files that you can version, reuse, and share. You can 
then use a consistent workflow to provision and manage all of your infrastructure throughout its 
lifecycle. Terraform can manage low-level components like compute, storage, and networking resources,
as well as high-level components like DNS entries and SaaS features.

# How does Terraform work?

Terraform creates and manages resources on cloud platforms and other services through their application 
programming interfaces (APIs). Providers enable Terraform to work with virtually any platform or service 
with an accessible API.

![alt text](https://content.hashicorp.com/api/assets?product=terraform&version=refs%2Fheads%2Fv1.3&asset=website%2Fimg%2Fdocs%2Fintro-terraform-apis.png&width=2048&height=644)

HashiCorp and the Terraform community have already written more than 1700 providers to manage thousands of different types of resources and services, and this number continues to grow. You can find all publicly available providers on the Terraform Registry, including Amazon Web Services (AWS), Azure, Google Cloud Platform (GCP), Kubernetes, Helm, GitHub, Splunk, DataDog, and many more.

The core Terraform workflow consists of three stages:

Write: You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.
Plan: Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.
Apply: On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.

![alt text](https://content.hashicorp.com/api/assets?product=terraform&version=refs%2Fheads%2Fv1.3&asset=website%2Fimg%2Fdocs%2Fintro-terraform-workflow.png&width=2038&height=1773)

# How to manually install terraform?

1- Download the latest version of terraform https://releases.hashicorp.com/terraform/<terraform_version>/terraform_<terraform_version>_linux_amd64.zip

2- Unzip terraform_<terraform_version>_linux_amd64.zip
    ex: unzip terraform_1.3.0_linux_amd64.zip

3- copy terraform into "/usr/local/bin"
    ex: cp terraform /usr/local/bin

4- execute below command to verify the version:
    ex: terraform version

The terraform directory contains 2 main sub-directories:
    
    - aws/infra-iac-codes: It will create an EC2 instance "t2.micro" along with all related services like:
        a. vpc
        b. subnet
        c. Route
        d. Internet gateway
        e. EBS
        f. EC2
        g. Keypair

        For deploy this part got to "aws/infra-iac-codes" folder and execute below commands in order:
            - terraform fmt
            - terraform init
            - terraform plan
            - terraform apply: this command output will show the public-ip of the EC2 instance.Use this in your ansible 
              playbook and also section below. 

    - docker: It will deploy the following service in the right order:
        a. Deploying a docker registry into the above created EC2 machine
        b. Push the application image into that registry
        c. Create a container of the application and publish its port

        For deploy this you need some changes:

        1- Copy "ssh.key" file from last terraform deploy into "terraform/docker" folder.
        2- 

