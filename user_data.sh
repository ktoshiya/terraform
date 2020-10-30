#!/bin/bash
sudo yum update
sudo amazon-linux-extras install nginx1
sudo service nginx start
sudo cat << FIN > /usr/share/nginx/html/index.html
  <!DOCTYPE html>
  <html lang="ja">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Terraformは楽しい</title>
  </head>
  <body>
    <h1>オレのTerraform</h1>
    <p>すげぇだろ？</p>
  </body>
  </html>
FIN
