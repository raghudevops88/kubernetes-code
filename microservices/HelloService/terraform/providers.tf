provider "aws" {
  region = "us-east-1"
  access_key = "AKIAEXAMPLE123"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  
}

provider "helm" {
  kubernetes {
    host = data.aws_eks_cluster.cluster.endpoint

  }
}



terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
          version = "2.17.0" 
    }
    kubectl = {
      source = "bnu0/kubectl"
      version = "0.27.0"
    }
  }

  backend "s3" {
    region = "us-east-1"
    bucket = "devops4solutions-terraform"
    key    = "eks/helloservice.tfstate"
  }
}
