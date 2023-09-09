#!/bin/bash
    sudo apt update -y &&
    sudo apt install -y nginx
    echo '<html><body><h1>Hello, Terraform Provisioned Me!</h1></body></html>' | sudo tee /var/www/html/index.html