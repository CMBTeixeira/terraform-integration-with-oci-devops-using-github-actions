############################
## Variables for Provider ##
############################

variable "provider_region" {
  description = "The region to connect to."
  type        = string
}

#########################
## Variables for VCN's ##
#########################

variable "vcn_1_region" {
  description = "The OCI region where resources will be created"
  type        = string
}

variable "vcn_1_name" {
  description = "User-friendly name to use for the VCN to be appended to the label_prefix"
  type        = string
}

variable "vcn_1_cidrs" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  type        = list(string)
}

variable "vcn_2_region" {
  description = "The OCI region where resources will be created"
  type        = string
}

variable "vcn_2_name" {
  description = "User-friendly name to use for the VCN to be appended to the label_prefix"
  type        = string
}

variable "vcn_2_cidrs" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  type        = list(string)
}

variable "vcn_3_name" {
  description = "User-friendly name to use for the VCN to be appended to the label_prefix"
  type        = string
}

variable "vcn_3_cidrs" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  type        = list(string)
}
