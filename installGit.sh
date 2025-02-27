#!/bin/bash

#installation Git 
sudo apt update
sudo apt install git
#Pour Debian / linux 
apt-get install git
# savoir la version installer 
git --version
# Pour configurer 
git config --global user.name "devel"

git config --global user.email "devel@algem.org"

#Vérifier les paramètres
git config --list
