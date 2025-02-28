#!/bin/bash
# Mise à jour système 
sudo apt update 
# Java est déjà installé version 17.0.14 2025-01-21
#Installez  Tomcat
sudo apt install tomcat10 tomcat10-admin tomcat10-docs tomcat10-examples
#Démarrer Tomcat
sudo systemctl start tomcat10
#Activer Tomcat au démarrage
sudo systemctl enable tomcat10
# Vérifier le status 
sudo systemctl status tomcat
#Arrêter Tomca
#sudo systemctl stop tomcat





