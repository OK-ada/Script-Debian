#!/bin/bash

# Mise à jours 
sudo apt update
#le moteur de base de données 
sudo apt install postgresql postgresql-client postgresql-contrib
# pour connaitre le status 
systemctl status postgresql
# Si le service n’est pas démarré ni activé au démarrage
 systemctl enable --now postgresql