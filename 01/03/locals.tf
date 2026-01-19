locals{
    install_docker_script = <<EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install -y docker.io
        sudo usermod -aG docker ubuntu
    EOF
}