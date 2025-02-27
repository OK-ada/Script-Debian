#!/bin/bash
# Mise à jour système 
sudo apt update 
# Java est déjà installé version 17.0.14 2025-01-21
#Installez le serveur Web Apache Tomcat
sudo apt install tomcat10 tomcat10-admin tomcat10-docs tomcat10-examples
#Démarrage du service Tomcat
sudo systemctl enable tomcat10
sudo systemctl start tomcat10
# Vérifier le status 
sudo systemctl status tomcat
