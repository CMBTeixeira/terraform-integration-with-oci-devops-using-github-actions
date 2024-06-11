#########
## VCN ##
#########

module "vcn_1" { #LINK https://registry.terraform.io/modules/oracle-terraform-modules/vcn/oci/3.6.0?tab=inputs
  source         = "oracle-terraform-modules/vcn/oci"
  version        = "3.6.0"
  compartment_id = local.cmbt_testing_compartment_id
  # optional inputs
  vcn_name  = var.vcn_1_name
  region    = var.vcn_1_region
  vcn_cidrs = var.vcn_1_cidrs
}

module "vcn_2" { #LINK https://registry.terraform.io/modules/oracle-terraform-modules/vcn/oci/3.6.0?tab=inputs
  source         = "oracle-terraform-modules/vcn/oci"
  version        = "3.6.0"
  compartment_id = local.cmbt_testing_compartment_id
  # optional inputs
  vcn_name  = var.vcn_2_name
  region    = var.vcn_2_region
  vcn_cidrs = var.vcn_2_cidrs
}

resource "oci_core_vcn" "vcn_3" { #LINK https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_vcn
  compartment_id = local.cmbt_testing_compartment_id
  # optional inputs
  display_name = var.vcn_3_name
  cidr_blocks  = var.vcn_3_cidrs
}

####################
## Dynamic Groups ##
####################

resource "oci_identity_dynamic_group" "dynamic_group_1" { #LINK - https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_dynamic_group
  #   provider       = oci.region
  name           = "dynamyc_group_random-github"
  compartment_id = local.tenancy_ocid
  description    = "just to test"
  matching_rule  = "All {resource.compartment.id = '${local.cmbt_testing_compartment_id}', Any {resource.type = 'devopsdeploypipeline', resource.type = 'devopsbuildpipeline', resource.type = 'devopsrepository', resource.type = 'devopsconnection', resource.type = 'devopstrigger'}}"
}

#######################
## Identity Policies ##
#######################

resource "oci_identity_policy" "recommended_policy_1" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = "recommended_policy_1-github"
  description    = "Recommended policies while creating the building pipeline in OCI DevOps. Core policies for managed build pipeline stage type."
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
  name           = "recommended_policy_2-github"
  description    = "Recommended policies while creating the building pipeline in OCI DevOps. Policies for VCN connection for managed build pipeline stage type."
  compartment_id = local.cmbt_testing_compartment_id
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to manage adm-vulnerability-audits in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use subnets in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use vnics in compartment ${local.cmbt_testing_compartment_name}",
  ]
}

resource "oci_identity_policy" "recommended_policy_3" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = "recommended_policy_3-github"
  description    = "Recommended policies while creating the building pipeline in OCI DevOps. Policies for NSGs connection for managed build pipeline stage type."
  compartment_id = local.cmbt_testing_compartment_id
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use network-security-groups in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use cabundles in compartment ${local.cmbt_testing_compartment_name}",
  ]
}

resource "oci_identity_policy" "recommended_policy_4" { #LINK - https://medium.com/@xsgdkh/infrastructure-provisioning-using-oci-devops-resource-manager-1e8a74d02a70
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = "recommended_policy_4-github"
  description    = "Recommended policies while creating the building pipeline in OCI DevOps. from this link: https://medium.com/@xsgdkh/infrastructure-provisioning-using-oci-devops-resource-manager-1e8a74d02a70 ."
  compartment_id = local.cmbt_testing_compartment_id
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to manage all-resources in compartment ${local.cmbt_testing_compartment_name}",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to use log-content in compartment ${local.cmbt_testing_compartment_name}",
  ]
}

resource "oci_identity_policy" "recommended_tenancy_policy_1" {
  depends_on     = [oci_identity_dynamic_group.dynamic_group_1]
  name           = "recommended_tenancy_policy_1-github"
  description    = "Recommended policies while creating the building pipeline in OCI DevOps. Allow Dynamic Group to read secrett-family tenancy and to read DevOps family in ${local.cmbt_testing_compartment_name} compartment."
  compartment_id = local.tenancy_ocid
  statements = [
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to read secret-family in tenancy",
    "Allow dynamic-group ${oci_identity_dynamic_group.dynamic_group_1.name} to read devops-family in compartment '${local.cmbt_testing_compartment_name}'"
  ]
}

###########################
## Object Storage Bucket ##
###########################

resource "oci_objectstorage_bucket" "create_bucket" {
  # required
  compartment_id = local.cmbt_testing_compartment_id
  name           = "cmbt-bucket-github"
  namespace      = data.oci_objectstorage_namespace.namespace.namespace

  # optional
  access_type = "NoPublicAccess" # <---- updated from "ObjectRead"
}
