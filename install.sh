#!/bin/bash

# installation de netbeans 

#Mise a jour de la base des packets 
sudo apt update -y 

#Aller dans le dossier opt
cd /opt 

#recuperer netbeans sur le site officiel 
sudo wget https://dlcdn.apache.org/netbeans/netbeans-installers/25/apache-netbeans_25-1_all.deb
 
sudo apt install ./apache-netbeans_25-1_all.deb 

#installation Git 
sudo apt update
sudo apt install git
#Pour Debian / linux 
apt-get install git
# savoir la version installer 
git --version
# Pour configurer 
git config --global user.name ""

git config --global user.email ""

#Vérifier les paramètres
git config --list
