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

##################################
## Variables for Dynamic Groups ##
##################################

variable "dynamic_group_1_name" {
  description = "(Required) The name you assign to the group during creation. The name must be unique across all groups in the tenancy and cannot be changed."
  type        = string
}

variable "dynamic_group_1_description" {
  description = "(Required) (Updatable) The description you assign to the group during creation. Does not have to be unique, and it's changeable."
  type        = string
}

#####################################
## Variables for Identity Policies ##
#####################################

variable "recommended_policy_1_name" {
  description = "(Required) The name you assign to the policy during creation. The name must be unique across all policies in the tenancy and cannot be changed."
  type        = string
}

variable "recommended_policy_1_description" {
  description = "(Required) (Updatable) The description you assign to the policy during creation. Does not have to be unique, and it's changeable."
  type        = string
}

variable "recommended_policy_2_name" {
  description = "(Required) The name you assign to the policy during creation. The name must be unique across all policies in the tenancy and cannot be changed."
  type        = string
}

variable "recommended_policy_2_description" {
  description = "(Required) (Updatable) The description you assign to the policy during creation. Does not have to be unique, and it's changeable."
  type        = string
}

variable "recommended_policy_3_name" {
  description = "(Required) The name you assign to the policy during creation. The name must be unique across all policies in the tenancy and cannot be changed."
  type        = string
}

variable "recommended_policy_3_description" {
  description = "(Required) (Updatable) The description you assign to the policy during creation. Does not have to be unique, and it's changeable."
  type        = string
}

variable "recommended_policy_4_name" {
  description = "(Required) The name you assign to the policy during creation. The name must be unique across all policies in the tenancy and cannot be changed."
  type        = string
}

variable "recommended_policy_4_description" {
  description = "(Required) (Updatable) The description you assign to the policy during creation. Does not have to be unique, and it's changeable."
  type        = string
}

variable "recommended_tenancy_policy_1_name" {
  description = "(Required) The name you assign to the policy during creation. The name must be unique across all policies in the tenancy and cannot be changed."
  type        = string
}

variable "recommended_tenancy_policy_1_description" {
  description = "(Required) (Updatable) The description you assign to the policy during creation. Does not have to be unique, and it's changeable."
  type        = string
}

#####################################
## Variables for Identity Policies ##
#####################################

variable "bucket_1_name" {
  description = "(Required) The name of the bucket. Valid characters are uppercase or lowercase letters, numbers, hyphens, underscores, and periods. Bucket names must be unique within an Object Storage namespace. Avoid entering confidential information."
  type        = string
}

variable "bucket_1_access_type" {
  description = "(Optional) (Updatable) The type of public access enabled on this bucket. A bucket is set to NoPublicAccess by default, which only allows an authenticated caller to access the bucket and its contents. When ObjectRead is enabled on the bucket, public access is allowed for the GetObject, HeadObject, and ListObjects operations. When ObjectReadWithoutList is enabled on the bucket, public access is allowed for the GetObject and HeadObject operations."
  type        = string
}


