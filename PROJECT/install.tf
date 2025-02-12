provisioner "local-exec" {
    command = "ansible-playbook -i '${self.public_ip},' --private-key ${var.private_key_path} install_jenkins.yml"
  }

