#!/bin/bash

# Désinstallation de PostgreSQL

echo "Arrêt du service PostgreSQL..."
sudo systemctl stop postgresql

echo "Suppression de PostgreSQL..."
sudo apt remove --purge -y postgresql postgresql-client postgresql-contrib

echo "Suppression des fichiers de configuration restants..."
sudo apt autoremove -y
sudo apt clean

echo "Suppression des fichiers PostgreSQL..."
sudo rm -rf /etc/postgresql
sudo rm -rf /var/lib/postgresql
sudo rm -rf /var/log/postgresql

echo "PostgreSQL a été désinstallé avec succès."
# Lancer le script 
#chmod +x uninstallPostgres.sh
#./uninstallPostgres.sh
