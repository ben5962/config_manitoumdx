#!/usr/bin/env bash

sudo sh -c 'echo "deb http://manitou-mail.org/apt/" $(lsb_release -cs) "main" > /etc/apt/sources.list.d/manitou.list'
wget http://manitou-mail.org/download/5D414B77.asc
sudo apt-key add 5D414B77.asc
sudo apt-get update
sudo apt-get install -y postgresql
sudo "manitou-mdx	manitou-mdx/install-db	boolean true" | debconf-set-selections
sudo apt-get install -y manitou-mdx    # for the mail-database exchanger
sudo apt-get install -y manitou-ui

