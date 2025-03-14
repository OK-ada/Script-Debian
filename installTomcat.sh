#!/bin/bash
# Mettre à jour les paquets
sudo apt update
#Installation de Java  
sudo apt install default-jdk
# Voir la version de Java
java -version
#Création répertoir pour ajouter un user 
mkdir /opt/tomcat9
# Téléchargement et installation de Tomcat 9 rechercher dans les archives 
VER=9.0.102
wget https://dlcdn.apache.org/tomcat/tomcat-9/v${VER}/bin/apache-tomcat-${VER}.tar.gz

#Extrayez le binaire Apache Tomcat 9 dans le répertoire /opt/tomcat9 .
tar xzf apache-tomcat-${VER}.tar.gz -C /opt/tomcat9 --strip-components=1

# Afficher le message de réussite
echo "Accédez à l'interface d'administration sur : http://localhost:8080 (nécessite configuration des utilisateurs)"
# Activer le service 
systemctl daemon-reload
systemctl enable --now tomcat9
# le status 
systemctl status tomcat9

# Execution 
#chmod +x installTomcat.sh
#./installTomcat.sh
