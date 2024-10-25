#!/bin/bash

DEV_WORKSPACE="dev"
STAGING_WORKSPACE="staging"
PRODUCTION_WORKSPACE="production"


tf_plan (){
 cd ./network/
 terraform init
 terraform workspace select -or-create=true "$1"
 terraform plan -var-file="../config/$1.tfvars"
 #terraform apply -var-file="../config/$1.tfvars" -auto-approve

 cd ../storage/
 terraform init
 terraform workspace select -or-create=true "$1"
 terraform plan -var-file="../config/$1.tfvars"
 #terraform apply -var-file="../config/$1.tfvars" -auto-approve

 cd ../compute/
 terraform init
 terraform workspace select -or-create=true "$1"
 terraform plan -var-file="../config/$1.tfvars"

 cd ..
}

tf_apply (){
 cd ./network/
 terraform init
 terraform workspace select -or-create=true "$1"
 terraform apply -var-file="../config/$1.tfvars" -auto-approve

 cd ../storage/
 terraform init
 terraform workspace select -or-create=true "$1"
 terraform apply -var-file="../config/$1.tfvars" -auto-approve

 cd ../compute/
 terraform init
 terraform workspace select -or-create=true "$1"
 terraform apply -var-file="../config/$1.tfvars" -auto-approve

 cd ..
}

tf_destroy (){

 cd ./storage/
 terraform init
 terraform workspace select "$1"
 terraform destroy -var-file="../config/$1.tfvars" -auto-approve

 cd ../compute/
 terraform init
 terraform workspace select "$1"
 terraform destroy -var-file="../config/$1.tfvars" -auto-approve

 cd ../network/
 terraform init
 terraform workspace select "$1"
 terraform destroy -var-file="../config/$1.tfvars" -auto-approve

 cd ..
}

echo "Do you want to trigger plan or apply?"
read choice

# If-else condition based on the input
if [ $choice == "plan" ]; then
    tf_plan "$DEV_WORKSPACE"
elif [ $choice == "apply" ]; then
    tf_apply "$DEV_WORKSPACE"
else
    echo "wrong choice: $choice"
fi