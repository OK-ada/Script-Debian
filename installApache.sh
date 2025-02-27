#!/bin/bash
#Mise à jour système
sudo apt install apache2
#Installation
sudo service apache2 start
#Démarage 
sudo systemctl start apache2
#Vérifier le statuts 
sudo systemctl status apache2
