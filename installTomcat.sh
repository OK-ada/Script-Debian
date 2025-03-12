#!/bin/bash
# Script d'installation de Tomcat 9 avec apt-get

# Mise à jour du système
sudo apt update && sudo apt upgrade -y

# Installation de Tomcat 9 et des outils d'administration
echo "Installation de Tomcat 9..."
sudo apt install -y tomcat9 tomcat9-admin

# Démarrer et activer Tomcat 9
echo "Démarrage et activation de Tomcat 9..."
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

# Vérifier le statut du service
sudo systemctl status tomcat9 --no-pager

# Afficher l'adresse d'accès à l'interface d'administration
echo "Tomcat 9 est installé et en cours d'exécution."
echo "Accédez à l'interface d'administration via : http://localhost:8080"

# Execution 
chmod +x installTomcat.sh
./installTomcat.sh
