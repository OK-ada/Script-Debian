#!/bin/bash
# Vérifier si le script est exécuté en tant que root et ne pas avoir à saisir le mot de passe plusieurs fois 
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./installTomcat.sh"
  exit 1
fi
# Mettre à jour les paquets
echo "Mise à jour des paquets..."
apt update && sudo apt upgrade -y

# Installation de Java  
echo "Installation de Java..."
apt install -y default-jdk

# Vérifier la version de Java
echo "Vérification de la version de Java..."
java -version

# Création du répertoire Tomcat et de l'utilisateur tomcat
echo "Création du répertoire Tomcat et de l'utilisateur tomcat..."
mkdir -p /opt/tomcat9
useradd -m -d /opt/tomcat9 -U -s /bin/false tomcat

# Télécharger et installer Tomcat 9
echo "Téléchargement et installation de Tomcat 9..."
VER=9.0.102
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-9/v${VER}/bin/apache-tomcat-${VER}.tar.gz

tar xzf apache-tomcat-${VER}.tar.gz -C /opt/tomcat9 --strip-components=1

# Fixer les permissions
echo "Changemment de propriétaire et des permissions des droit sur le répertoire Tomcat..."
chown -R tomcat:tomcat /opt/tomcat9
chmod -R 755 /opt/tomcat9

# Installer Tomcat 9 Admin
echo "Installation de Tomcat 9 Admin..."
sudo apt install -y tomcat9-admin

# Créer le fichier de service systemd
echo "Création du fichier de service systemd..."
sudo bash -c 'cat > /etc/systemd/system/tomcat.service << EOF
[Unit]
Description=Apache Tomcat 9
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/default-java"
Environment="CATALINA_HOME=/opt/tomcat9"
Environment="CATALINA_BASE=/opt/tomcat9"
ExecStart=/opt/tomcat9/bin/startup.sh
ExecStop=/opt/tomcat9/bin/shutdown.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

# Recharger systemd et activer Tomcat
echo "Recharger systemd et activer Tomcat..."
sudo systemctl daemon-reload
sudo systemctl enable --now tomcat

# Vérifier le statut de Tomcat
echo "Vérification du statut de Tomcat..."
sudo systemctl status tomcat --no-pager

# Afficher le message de réussite
echo "Accédez à Tomcat sur : http://localhost:8080"
