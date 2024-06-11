terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  tenancy_ocid     = local.tenancy_ocid
  user_ocid        = local.user_ocid
  fingerprint      = local.fingerprint
  private_key_path = local.private_key_path
  region           = var.provider_region
}
