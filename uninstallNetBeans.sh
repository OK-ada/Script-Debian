#!/bin/bash

# Désinstallation de NetBeans

echo "Suppression de NetBeans..."

# Suppression du paquet NetBeans
sudo apt remove --purge -y apache-netbeans

# Suppression des fichiers de configuration restants
sudo apt autoremove -y
sudo apt clean

# Suppression du fichier d’installation s'il est toujours présent
sudo rm -f /opt/apache-netbeans_25-1_all.deb

# Suppression du dossier d'installation de NetBeans s'il existe
sudo rm -rf /opt/netbeans

echo "NetBeans a été désinstallé avec succès."

#  Lancer le script  
#chmod +x uninstallNetBeans.sh
#./uninstallNetBeans.sh
