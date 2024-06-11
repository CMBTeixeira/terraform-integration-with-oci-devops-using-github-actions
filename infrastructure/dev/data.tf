data "oci_objectstorage_namespace" "namespace" {
  compartment_id = local.cmbt_testing_compartment_id
}
