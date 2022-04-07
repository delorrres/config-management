output "web_server_ips" {
    value =aws_instance.web_server.*.public_ip
}