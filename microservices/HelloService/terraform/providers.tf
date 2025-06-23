provider "aws" {
  region = "us-east-1"
export AWS_ACCESS_KEY_ID="AKIAY4C4TDU2DRNQD546"
export AWS_SECRET_ACCESS_KEY="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"
  
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
