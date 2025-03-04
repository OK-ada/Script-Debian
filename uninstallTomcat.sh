#!/bin/bash

# Désinstallation de Tomcat

echo "Arrêt du service Tomcat..."
sudo systemctl stop tomcat10

echo "Désactivation du démarrage automatique de Tomcat..."
sudo systemctl disable tomcat10

echo "Suppression de Tomcat..."
sudo apt remove --purge -y tomcat10 tomcat10-admin tomcat10-docs tomcat10-examples

echo "Suppression des fichiers de configuration restants..."
sudo apt autoremove -y
sudo apt clean

echo "Suppression des fichiers Tomcat..."
sudo rm -rf /etc/tomcat10
sudo rm -rf /var/lib/tomcat10
sudo rm -rf /usr/share/tomcat10
sudo rm -rf /var/log/tomcat10

echo "Tomcat a été désinstallé avec succès."

# Lancer le script 
#chmod +x uninstallTomcat.sh
#./uninstallTomcat.sh
