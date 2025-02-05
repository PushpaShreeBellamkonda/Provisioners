resource "aws_instance" "db" {
        ami = "ami-09c813fb71547fc4f"
        instance_type = "t3.micro"

# provisioners will only run while creating resources
# they will not run once the resources are created


       
        # provisioner "local-exec" {
        #   command = "echo ${self.private_ip} > private_ips.txt"
        # }

        provisioner "local-exec" {
          command = "ansible-playbook -i private_ips.txt web.yaml"
        }

        connection {
          type = "ssh"
          user = "ec2-user"
          password = "DevOps321"
          host = self.punlic_ip
        }

        provisioner "remote-exec" {
                inline = [ 
                        "sudo dnf install ansible -y" ,
                        "sudo dnf install nginx -y" ,
                        "sudo systemctl start nginx"
                 ]
          
        }
}

