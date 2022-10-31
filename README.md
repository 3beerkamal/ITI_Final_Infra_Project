# GCP_Infrastructure_with_Terraform
## Project Info

This projcet is a good practice to build IAC in GCP using Terraform:
* All infrastructure provisioned with terrafom [https://registry.terraform.io/providers/hashicorp/google/latest/docs]
* Dockerized python app [/app/Dockerfile]
* Findly deployed app on GEK with Kubernetes

# Pre-requisits:
* Setup account in "Google Cloud Platfom" GCP Console using https://console.cloud.google.com/
   then create new project and change the value of "project_name".
* Install gcloud cli in your local machine to be able to access your GCP console account.
* Install terraform using https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
* Clone my project from here https://github.com/3beerkamal/GCP_Infrastructure_with_Terraform.git

# Get started
* First change directory to cloned folder
  ```bash
    cd /GCP_Infrastructure_with_Terraform
    ```
* Second build the infrastructure by run:
  ```bash
    terraform init
    ```
  ```bash
    terrafrom plan --var-file=input.tfvars
    ```
  ```bash
    terrafrom apply --var-file=input.tfvars
    ```
*  Then if you go to your project that created in GCP you will find that the following resources built:
    
    * VPC named "vpc"
    * 2 Subnets "management", "restricted"
    * 3 Service Accounts
        * "vm-service-account" used by Management VM 
        * "nodes-services-account" used by Kubernetes cluster
    * NAT in "management" Subnetwork
    * Private Virtual Machine in "management" subnetwork to manage the private cluster.
    * Private Kubernetes cluster in "restricted" subnetwork with 3 worker nodes.
