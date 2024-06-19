## Values for Provider ##

provider_region = "uk-london-1"

## Values for VCN's ##

vcn_1_name   = "github-vcn-dev-1"
vcn_1_region = "uk-london-1"
vcn_1_cidrs  = ["10.0.0.0/20"]

vcn_2_name   = "github-vcn-dev-2"
vcn_2_region = "uk-london-1"
vcn_2_cidrs  = ["10.0.16.0/20"]

vcn_3_name  = "github-vcn-dev-3"
vcn_3_cidrs = ["10.0.32.0/20"]

## Values for Dynamic Groups ##

dynamic_group_1_name        = "dynamyc_group_random-github"
dynamic_group_1_description = "just to test"

## Values for Policies ##

recommended_policy_1_name        = "recommended_policy_1-github"
recommended_policy_1_description = "Recommended policies while creating the building pipeline in OCI DevOps. Core policies for managed build pipeline stage type."

recommended_policy_2_name        = "recommended_policy_2-github"
recommended_policy_2_description = "Recommended policies while creating the building pipeline in OCI DevOps. Policies for VCN connection for managed build pipeline stage type."

recommended_policy_3_name        = "recommended_policy_3-github"
recommended_policy_3_description = "Recommended policies while creating the building pipeline in OCI DevOps. Policies for NSGs connection for managed build pipeline stage type."

recommended_policy_4_name        = "recommended_policy_4-github"
recommended_policy_4_description = "Recommended policies while creating the building pipeline in OCI DevOps. from this link: https://medium.com/@xsgdkh/infrastructure-provisioning-using-oci-devops-resource-manager-1e8a74d02a70 ."

recommended_tenancy_policy_1_name        = "recommended_tenancy_policy_1-github"
recommended_tenancy_policy_1_description = "Recommended policies while creating the building pipeline in OCI DevOps. Allow Dynamic Group to read secret-family tenancy and to read DevOps family in the working compartment."

## Values for Storage Bucket ##

bucket_1_name        = "cmbt-bucket-github"
bucket_1_access_type = "NoPublicAccess"
