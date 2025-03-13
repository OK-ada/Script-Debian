#!/bin/bash

# Vérifier si le script est exécuté en tant que root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./installTomcat.sh"
  exit 1
fi

# Mettre à jour les paquets
sudo apt update

# Installer Tomcat 9 et les outils d'administration
sudo apt install -y tomcat9 tomcat9-admin

# Activer et démarrer Tomcat
systemctl enable tomcat9
systemctl start tomcat9

# Vérifier le statut de Tomcat
systemctl status tomcat9 --no-pager

# Afficher le message de réussite
echo "Tomcat 9 et Tomcat 9 Admin ont été installés avec succès !"
echo "Accédez à l'interface d'administration sur : http://localhost:8080/manager/html (nécessite configuration des utilisateurs)"

# Execution 
#chmod +x installTomcat.sh
#./installTomcat.sh
