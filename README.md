# Infrastructure_with_Terraform_and_GCP
### Project Info

This projcet is a good practice to build IAC in GCP using Terraform:
* All infrastructure provisioned with [Terrafom](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
* Dockerized python app [Dockerfile](https://github.com/3beerkamal/GCP_Infrastructure_with_Terraform/blob/master/App/Dockerfile)
* Findly deployed app on GEK with Kubernetes

### Pre-requisits:
* Setup account in "Google Cloud Platfom" [GCP Console](https://console.cloud.google.com/)
   then create new project and change the value of "project_name".
* Install [gcloud cli](https://cloud.google.com/sdk/docs/install) in your local machine to be able to access your GCP console account.
* Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) in your local machine.
* Clone [project Repo](https://github.com/3beerkamal/GCP_Infrastructure_with_Terraform.git)

### Tools Used
<p align="center">
<a href="https://www.terraform.io/" target="_blank" rel="noreferrer"><img src="https://github.com/3beerkamal/3beerkamal/blob/main/Icons/terraform-icon.svg" alt="terraform" width="40" height="40"/></a><a href="https://cloud.google.com" target="_blank" rel="noreferrer"> <img src="https://github.com/3beerkamal/3beerkamal/blob/main/Icons/GCP.png" alt="gcp" width="90" height="50"/></a><a href="https://kubernetes.io" target="_blank" rel="noreferrer"><img src="https://github.com/3beerkamal/3beerkamal/blob/main/Icons/Kubernetes-icon-color.svg.png" alt="kubernetes" width="40" height="40"/></a> 
</p>

### :rocket: Get started
* First, After installing gcloud, you should authenticate you local machine to access [GCP Console](https://console.cloud.google.com/):
   ```bash
    gcloud init
    ```
   ```bash
    gcloud config set account <GCP_ACCOUNT>
    ```
   ```bash
    gcloud config set project <PROJECT_ID>
    ```
* Second, Change directory to project folder that was cloned:
  ```bash
    cd /GCP_Infrastructure_with_Terraform
    ```
* After that, Start to build the infrastructure by run:
  ```bash
    terraform init
    ```
  ```bash
    terrafrom plan --var-file=input.tfvars
    ```
  ```bash
    terrafrom apply --var-file=input.tfvars
    ```
*  Then, If you go to your project that is created in GCP, you will find that the following resources are built:
   
    * VPC named "vpc"
    * 2 Subnets "management", "restricted"
    * 2 Service Accounts
        * "vm-service-account" used by Management VM 
        * "nodes-services-account" used by Kubernetes cluster
    * NAT in "management" as private subnetwork
    * Private Virtual Machine in "management" subnetwork to manage the private cluster.
    * Private Kubernetes cluster in "restricted" subnetwork with 3 worker nodes.
 ### Note
     Only VM in "management" subnetwork can access the Kubernetes cluster.
     
     
### Build & Push Docker Image to GCR
* Build the Docker Image in your local machine by run

    ```bash
    cd /App
    docker build . -t [python-app]
    ```
* Setup credentials for docker to Push to GCR using "docker-gcr-sa" Service Account

    ```bash
    gcloud auth activate-service-account docker-gcr-sa --key-file=KEY-FILE
    gcloud auth configure-docker
    ```
* Push the Created Image to GCR

   ```bash
    docker tag python-app gcr.io/<project_id>/<python-app>
    ```
   ```bash
    docker push eu.gcr.io/<project_id>/<python-app>:1.0
    ```
    
### Deploy image on private cluster
* After the infrastructure got built, now you can login to the "management-vm" VM using SSH then:
    
    * Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) tool
    * setup cluster credentials
    
        ```bash
        gcloud container clusters get-credentials app-cluster --zone <europe-west1-b> --project <PROJECT-ID>
        ```
    * Install [gke-gcloud-auth-plugin](https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke)
    * Run this command to ensure that kubectl see your cluster
    
        ```bash 
        kubectl cluster-info
        ```
    * Upload the "kubernetes" dir to the VM and run
    
        ```
        kubectl apply -f kubernetes/
        ```
---
Now, you can access the Demo App by hitting the Ingress IP 
    
    
    
