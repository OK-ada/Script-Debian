#!/bin/bash
#Mise à jour 
sudo apt update
#installation Git 
sudo apt install git
# savoir la version installer 
git --version
# Pour configurer 
git config --global user.name "devel"

git config --global user.email "devel@algem.org"

#Vérifier les paramètres
git config --list
