########################################################################################
# VPC-CIDR BLOCK
########################################################################################

variable "vpc_cidr_value" {
  description = "CIDR value for vpc creation"
  type        = string
  default     = "10.0.0.0/16"
}

########################################################################################
# ENVIRONMENT
########################################################################################

variable "environment" {
  description = "Environment for vpc creation"
  type        = string
  default     = "dev"
}

########################################################################################
# SUBNET VARIABLES
########################################################################################

variable "public-subnet-cidr-value" {
  description = "CIDR for public subnet creation"
  type        = string
  default     = "10.0.0.0/24"
}

variable "private-subnet-cidr-value" {
  description = "CIDR for private subnet creation"
  type        = string
  default     = "10.0.1.0/24"
}

