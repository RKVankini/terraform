#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
echo "<h1>Welcome to RK AutoScaling App - $(hostname)</h1>" > /var/www/html/index.html
sudo systemctl restart apache2
