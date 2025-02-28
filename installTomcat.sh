#!/bin/bash
# Mise à jour système 
sudo apt update 
# Java est déjà installé version 17.0.14 2025-01-21
#Installez  Tomcat
sudo apt install -y tomcat9 tomcat9-admin
#Démarrer Tomcat
sudo systemctl start tomcat9
#Activer Tomcat au démarrage
sudo systemctl enable tomcat9
# Vérifier le status 
sudo systemctl status tomcat9
#Arrêter Tomca
#sudo systemctl stop tomcat9





