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

