# plan_a_2

## Prerequisites and assumptions. - 

This Readme file assumes Terraform is running on your node and Git is installed so to be able to clone the repository with the required files for creating AWS infrastructure and Kubernetes' cluster.
For documenting the examples a maching running ArchLinux was used but unless something is noted, the commands and the outputs, should be the same for any OS

### Installing Git

You could find the instructions for installing Git in https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git

### Installing Terraform

Official documentation for installing Terraform in your operating system is at https://learn.hashicorp.com/tutorials/terraform/install-cli

## Installing the cluster

The steps needed for the installation are:
1. Installing packages
2. Cloning the repository
3. Initializing Terraform
4. Validate the plan
5. Apply the plan

We will follow these steps and check the results in AWS site.

### Installing packages

As we said before this are the commands for doing it in ArchLinux. Check the websites above for the instructions on your OS

Installing Git:

    sudo pacman -Sy git

Installing terraform:

    sudo pacman -Sy terraform
### Cloning the repository

Clone repo at: git@github.com:lmayala/plan_a_2.git and change into the cloned folder

    git clone git@github.com:lmayala/plan_a_2.git
    cd plan_a_2

### Initialize Terraform

In order to download all the modules required by Terraform for executing the script an initialization command is required:

    terraform init

### Validate and check the plan

You can validate the syntax by running:

    terraform validate
    
If everything goes right you should see something like:
![image](https://user-images.githubusercontent.com/23105734/158883262-4ee4411b-01e4-459b-bfdb-8b1269fa6672.png)

Checking the plan:

    terraform plan
    
Here the output will show what will happen when applying the plan. You can use this to check if the result is the expected before applying the plan.

### Applying the plan

    terraform apply

This command will apply the plan. Take in to account that it will ask for confirmation and a 'yes' will be required a response.


## Screenshots

VPC has been created

![image](https://user-images.githubusercontent.com/23105734/158888972-0eb65f9a-be24-42b1-8a4b-8d5030caad6a.png)


The private and public subnetworks are inside the VPC

![image](https://user-images.githubusercontent.com/23105734/158889151-a952bcfa-a1c5-462a-9f2c-b2d537a631b9.png)


The EKS cluster has been created with two t3a.large nodes inside:

![image](https://user-images.githubusercontent.com/23105734/158889439-da8c21d9-ae75-450c-a3d6-6cc42a79e6ba.png)

![image](https://user-images.githubusercontent.com/23105734/158897236-263b2fbc-4c3e-446a-8adf-2430783da889.png)

And while checking the details, we can see each of the nodes are in each of the private subnets:

![image](https://user-images.githubusercontent.com/23105734/158897453-dd02b1d2-63d3-4fba-884a-7bbb9ab4ea53.png)
![image](https://user-images.githubusercontent.com/23105734/158897496-0f902e2a-7604-40b8-9c05-01aa452b79f0.png)




