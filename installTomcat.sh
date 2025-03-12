#!/bin/bash
# Script d'installation de Tomcat 9 

# Mise à jour système 
sudo apt update
# Installation de Java si non installé
sudo apt install default-jdk
java -version

openjdk version "17.0.8" 2023-07-18
OpenJDK Runtime Environment (build 17.0.8+7-Debian-1deb12u1)
OpenJDK 64-Bit Server VM (build 17.0.8+7-Debian-1deb12u1, mixed mode, sharing)

# Installation de Tomcat 9 et des outils d'administration
echo "Installation de Tomcat 9..."
sudo apt install -y tomcat9 tomcat9-admin

# Démarrer et activer Tomcat 9
echo "Démarrage et activation de Tomcat 9..."
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

# Vérifier le statut du service
sudo systemctl status tomcat9 

# Afficher l'adresse d'accès à l'interface d'administration
echo "Tomcat 9 est installé et en cours d'exécution."
echo "Accédez à l'interface d'administration via : http://localhost:8080"

# Execution 
chmod +x installTomcat.sh
./installTomcat.sh
