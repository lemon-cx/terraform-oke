# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

# kubectl
data "template_file" "install_kubectl" {
  template = file("${path.module}/scripts/install_kubectl.template.sh")

  vars = {
    ol = var.operator_os_version
  }
}

resource "null_resource" "install_kubectl_operator" {
  connection {
    host        = oci_core_instance.operator.public_ip
    private_key = file(var.operator_ssh_private_key_path)
    timeout     = "40m"
    type        = "ssh"
    user        = "opc"

  }

  provisioner "file" {
    content     = data.template_file.install_kubectl.rendered
    destination = "~/install_kubectl.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x $HOME/install_kubectl.sh",
      "bash $HOME/install_kubectl.sh",
      "rm -f $HOME/install_kubectl.sh"
    ]
  }

}
