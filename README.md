# echo-app
Terraform GKE + Nginx Ingress Port 3333) + Echo App ( Port 8080)

#Steps to Deploy app:


To Create GKE cluster, create a service account for Terraform  (with permissions to create GKE CLuster and resources)

Download the key.json for the Service account

Edit the provider.tf with the json file name

Update the test.tfvars file with GCP project name

run:

`cd terraform-gke`

 `terraform init`

`terraform plan  -var-file test.tfvars`

`terraform apply  -var-file test.tfvars`

#Now deploy Nginx ingress and Echo app:

For this you need to have Helm 3 installed in as binary named helm3

to install Nginx Ingress run:


`deploy_nginx_ingress.sh
`

After this deploy the echo app with:


`
bash  deploy_echo.sh
`

Now find the Public IP of Nginx Ingress controller with:


` kubectl -n nginx-ingress get svc
`

Add a /etc/host entry with this IP:


`<IP_OF_INGRESS_CONTROLLER> echo-example.local`


After this you can access the echo app at:

`http://echo-example.local:3333`

Cheers!!!
