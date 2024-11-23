environments = {
  default = {
    # Global variables
    cluster_name                   = "codedevops-cluster"
    env                            = "default"
    region                         = "us-east-2"
    vpc_id                         = "vpc-03453322b9538d75b"
    vpc_cidr                       = "10.0.0.0/16"
    public_subnet_ids              = ["subnet-082ffb08e0cc6fb95", "subnet-0ee8aad8e4bd8a08f"]
    cluster_version                = "1.30"
    cluster_endpoint_public_access = true
    ecr_names                      = ["codedevops"]

    # EKS variables
    eks_managed_node_groups = {
      generalworkload-v4 = {
        min_size       = 1
        max_size       = 1
        desired_size   = 1
        instance_types = ["m5a.xlarge"]
        capacity_type  = "ON_DEMAND"
        disk_size      = 60
        ebs_optimized  = true
        iam_role_additional_policies = {
          ssm_access        = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
          cloudwatch_access = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
          service_role_ssm  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
          default_policy    = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
        }
      }
    }
    cluster_security_group_additional_rules = {}

    # EKS Cluster Logging
    cluster_enabled_log_types = ["audit"]
    eks_access_entries = {
      viewer = {
        user_arn = []
      }
      admin = {
        user_arn = ["arn:aws:iam::339712959870:root"]
      }
    }
    # EKS Addons variables 
    coredns_config = {
      replicaCount = 1
    }
  }

}
