########
# VCN ##
########

module "vcn_1" {
  source         = "oracle-terraform-modules/vcn/oci"
  version        = "3.6.0"
  compartment_id = local.cmbt_testing_compartment_id

  vcn_name  = var.vcn_1_name
  region    = var.vcn_1_region
  vcn_cidrs = var.vcn_1_cidrs
}

module "vcn_2" {
  source         = "oracle-terraform-modules/vcn/oci"
  version        = "3.6.0"
  compartment_id = local.cmbt_testing_compartment_id

  vcn_name  = var.vcn_2_name
  region    = var.vcn_2_region
  vcn_cidrs = var.vcn_2_cidrs
}

resource "oci_core_vcn" "vcn_3" {
  compartment_id = local.cmbt_testing_compartment_id

  display_name = var.vcn_3_name
  cidr_blocks  = var.vcn_3_cidrs
}

###################
# Dynamic Groups ##
###################

resource "oci_identity_dynamic_group" "dynamic_group_1" {
  name           = var.dynamic_group_1_name
  compartment_id = local.tenancy_ocid
  description    = var.dynamic_group_1_description
  matching_rule  = "All {resource.compartment.id = '${local.cmbt_testing_compartment_id}', Any {resource.type = 'devopsdeploypipeline', resource.type = 'devopsbuildpipeline', resource.type = 'devopsrepository', resource.type = 'devopsconnection', resource.type = 'devopstrigger'}}"
}

######################
# Identity Policies ##
######################

resource "oci_identity_policy" "recommended_policy_1" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = var.recommended_policy_1_name
  description    = var.recommended_policy_1_description
  compartment_id = local.cmbt_testing_compartment_id
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to read secret-family in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use ons-topics in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use adm-knowledge-bases in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use devops-family in compartment ${local.cmbt_testing_compartment_name}",
  ]
}

resource "oci_identity_policy" "recommended_policy_2" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = var.recommended_policy_2_name
  description    = var.recommended_policy_2_description
  compartment_id = local.cmbt_testing_compartment_id
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to manage adm-vulnerability-audits in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use subnets in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use vnics in compartment ${local.cmbt_testing_compartment_name}",
  ]
}

resource "oci_identity_policy" "recommended_policy_3" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = var.recommended_policy_3_name
  description    = var.recommended_policy_3_description
  compartment_id = local.cmbt_testing_compartment_id
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use network-security-groups in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use cabundles in compartment ${local.cmbt_testing_compartment_name}",
  ]
}

resource "oci_identity_policy" "recommended_policy_4" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = var.recommended_policy_4_name
  description    = var.recommended_policy_4_description
  compartment_id = local.cmbt_testing_compartment_id
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to manage all-resources in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use log-content in compartment ${local.cmbt_testing_compartment_name}",
  ]
}

resource "oci_identity_policy" "recommended_tenancy_policy_1" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = var.recommended_tenancy_policy_1_name
  description    = var.recommended_tenancy_policy_1_description
  compartment_id = local.tenancy_ocid
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to read secret-family in tenancy",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to read devops-family in compartment '${local.cmbt_testing_compartment_name}'"
  ]
}

##########################
# Object Storage Bucket ##
##########################

resource "oci_objectstorage_bucket" "bucket_1" {
  compartment_id = local.cmbt_testing_compartment_id
  name           = var.bucket_1_name
  namespace      = local.account_namespace
  access_type    = var.bucket_1_access_type
}
