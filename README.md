# Echo-app
Terraform GKE + Nginx Ingress ( Port 3333) + Echo App ( Port 8080)

# Prerequisites:

Install Terraform: We use Terraform to create GKE and related resources.
Please install Terraform by following: https://learn.hashicorp.com/terraform/getting-started/install.html


Install Gcloud: To get the GKE credetials we need Gcloud installed in your path.
Install Gcloud by following https://cloud.google.com/sdk/install

Install Kubectl: Kubectl is used by the Echo app deployment script. Please install by following: https://kubernetes.io/docs/tasks/tools/install-kubectl/


Install Helm 3 : 
You need to have Helm latest version 3.x ( https://github.com/helm/helm/releases ) installed in as binary named helm3 in your path. This is not to conflict with Helm Version 2 if you have already installed it. Otherwise if you have only Helm 3 installed as helm in path, you can edit the scripts (deploy_echo.sh, deploy_nginx_ingress.sh) and update the command helm3 to helm.


# Steps to Create GKE cluster, Ingress and deploy app:


To Create GKE cluster, create a service account for Terraform  (with permissions to create GKE CLuster and resources)

Download the key.json for the Service account

Edit the provider.tf with the json file name

Update the test.tfvars file with GCP project name

After than run Terrafform:

`cd terraform-gke`

 `terraform init`

`terraform plan  -var-file test.tfvars`

`terraform apply  -var-file test.tfvars`

Please note that last step in Terraform will download the GKE credentails to your ~/.kube/config. If you already have the config file it will merge to it.

# Now deploy Nginx ingress and Echo app:

We expopose the Echo App to outside cluster using Nginx Ingress on port 3333

( https://github.com/helm/charts/tree/master/stable/nginx-ingress )

To install Nginx Ingress run:


`deploy_nginx_ingress.sh
`

After this deploy the echo app with:


`
bash  deploy_echo.sh
`

Now find the Public IP of Nginx Ingress controller with:


`kubectl -n nginx-ingress get svc`

Add a /etc/host entry with this IP:


`<IP_OF_INGRESS_CONTROLLER> echo-example.local`

Please note that, if you access directly on the IP, application will not work. It would show an error Default Backend 404


After this you can access the echo app at:

`http://echo-example.local:3333`

Cheers!
