#!/bin/bash

# Vérifier si le script est exécuté en tant que root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./uninstall_tomcat9.sh"
  exit 1
fi

# Arrêter le service Tomcat
systemctl stop tomcat9

# Désactiver le service Tomcat
systemctl disable tomcat9

# Supprimer Tomcat 9 et Tomcat 9 Admin
apt remove -y tomcat9 tomcat9-admin
apt autoremove -y

# Supprimer les fichiers de configuration restants
rm -rf /etc/tomcat9 /var/lib/tomcat9 /var/log/tomcat9

# Vérification de la suppression
echo "Tomcat 9 et ses composants ont été désinstallés avec succès."

# Lancer le script 
#chmod +x uninstallTomcat.sh
#./uninstallTomcat.sh
