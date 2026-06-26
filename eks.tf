module "eks" {
    #import the module template
    source = "terraform-aws-modules/eks/aws"
    version = "~> 20.37"
    
    #cluster info (control plane)
    cluster_name = local.name
    cluster_endpoint_public_access = true

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    cluster_addons = {
        vpc_cni = {
        name = "vpc-cni"
            most_recent = true
        }
        kube-proxy = {
            most_recent = true
        }
        coredns = {
            most_recent = true
        }
    }

    #control plane network
    control_plane_subnet_ids = module.vpc.intra_subnets

    #managing node in cluster
    eks_managed_node_group_defaults  = {
  
      instance_types = ["t3.micro"]
      attach_cluster_primary_security_group = true

    }

    eks_managed_node_groups = {
    sk-cluster-ng = {
      instance_types = ["t3.micro"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
    }
  }


    tags = {
        Environment = local.env
        Terraform = "true"
    }
}