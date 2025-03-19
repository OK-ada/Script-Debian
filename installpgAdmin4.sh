#!/bin/bash
# Vérifier si le script est exécuté en tant que root et ne pas avoir à saisir le mot de passe plusieurs fois 
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./installpgAdmin4.sh"
  exit 1
fi
# Setup the repository

# Install the public key for the repository (if not done previously):
echo "Installation de la clé publique pour le dépôt..."
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

# Create the repository configuration file:
echo "Création du fichier de configuration du dépôt..."
sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install pgAdmin

# Install for both desktop and web modes:
echo "Installion de pgAdmin4 cersion Bureau et Web"
apt install pgadmin4

# Configure the webserver, if you installed pgadmin4-web:
echo "Configuration du serveur web"
/usr/pgadmin4/bin/setup-web.sh