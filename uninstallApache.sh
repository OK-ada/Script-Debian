#!/bin/bash

# Désinstallation d'Apache

echo "Arrêt du service Apache..."
sudo systemctl stop apache2

echo "Suppression d'Apache..."
sudo apt remove --purge -y apache2

echo "Suppression des fichiers de configuration restants..."
sudo apt autoremove -y
sudo apt clean

echo "Suppression des fichiers Apache..."
sudo rm -rf /etc/apache2
sudo rm -rf /var/www/html

echo "Apache a été désinstallé avec succès."
# Lancer le script 
#chmod +x uninstallApache.sh
#./uninstallApache.sh
