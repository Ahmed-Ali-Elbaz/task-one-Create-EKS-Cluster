# EKS cluster input variables

# Cluster name
variable "cluster_name" {
  description = "name of the eks cluster, Also used as a prefix in names of related resources."
  type = string
  default = "eksdemo"
}

# Kubernetes version for the EKS cluster
variable "cluster_version" {
  description = "Kubernetes minor version to use for EKS cluster (for example 1.21)"
  type = string
  default = null # default: latest version
}

  /*
    - When a value is not provided for a variable in the Terraform configuration, the default value will be used.
    - Setting "default = null" in a variable block means that the variable has no default value.
      If a value is not provided for the variable in the Terraform configuration, Terraform will raise an error prompting the user to provide a value.
  */

# CIDR block for the Kubernetes service IPs in the cluster
variable "cluster_service_ipv4_cidr" {
  description = "Service ipv4 cidr for the Kubernetes Cluster"
  type = string
  default = null # default: 10.100.0.0/20
}


variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false # default = true
}

  /*
    If set to "true" the Kubernetes API server endpoint will only be accessible from within the VPC.
    If set to "false" the Kubernetes API server endpoint will be accessible from the internet and from within the VPC.
  */


variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true # default = true
}

  /*
    If set to "true" the Kubernetes API server endpoint will be publicly accessible.
    If set to "false" the Kubernetes API server endpoint will only be accessible from within the VPC.
  */

variable "cluster_endpoint_public_access_cidrs" { # if cluster_endpoint_public_access = false this will be ignored
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"] 
}

  /*
    - only traffic come from this CIDR blocks will be allowed to access the Kubernetes API server endpoint.
      It's important to specify a restrictive list of CIDR blocks to prevent unauthorized access
      to the Kubernetes API server endpoint from the internet.

    - If you don't need public access to your EKS cluster, it's generally recommended to disable it altogether by setting "cluster_endpoint_public_access" to false.
  */

