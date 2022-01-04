output "operator_public_ip_addr" {
  value = oci_core_instance.operator.public_ip
}

output "mds_private_ip_addr" {
  value = oci_mysql_mysql_db_system.MDSinstance.ip_address
}