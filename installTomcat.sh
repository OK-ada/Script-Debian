#!/bin/bash
# Mise à jour système 
sudo apt update 
# Java est déjà installé version 17.0.14 2025-01-21
# Installation de Java si non installé
if ! java -version &>/dev/null; then
    echo "Java n'est pas installé. Installation en cours..."
    sudo apt install -y default-jdk
fi

# Définition des variables
TOMCAT_VERSION=$(curl -s https://downloads.apache.org/tomcat/tomcat-10/ | grep -oP '(?<=href=")[0-9]+\.[0-9]+\.[0-9]+(?=/")' | sort -V | tail -n 1)
TOMCAT_URL="https://downloads.apache.org/tomcat/tomcat-10/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz"
INSTALL_DIR="/opt/tomcat"
# Téléchargement de la dernière version de Tomcat
echo "Téléchargement de Tomcat $TOMCAT_VERSION..."
sudo wget -O /tmp/apache-tomcat.tar.gz $TOMCAT_URL
# Extraction des fichiers
echo "Installation de Tomcat..."
sudo mkdir -p $INSTALL_DIR
sudo tar -xzf /tmp/apache-tomcat.tar.gz -C $INSTALL_DIR --strip-components=1

# Attribution des permissions
sudo chmod +x $INSTALL_DIR/bin/*.sh
sudo chown -R $USER:$USER $INSTALL_DIR
# Création du service systemd
echo "Configuration du service Tomcat..."
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat
After=network.target

[Service]
Type=forking
User=$USER
Group=$USER
WorkingDirectory=$INSTALL_DIR
ExecStart=$INSTALL_DIR/bin/startup.sh
ExecStop=$INSTALL_DIR/bin/shutdown.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

#Démarrer Tomcat
sudo systemctl start tomcat10
#Activer Tomcat au démarrage
sudo systemctl enable tomcat10
# Vérifier le status 
sudo systemctl status tomcat
echo "Tomcat $TOMCAT_VERSION a été installé avec succès et est en cours d'exécution."

#Arrêter Tomca
sudo systemctl stop tomcat

# Execution 
chmod +x installTomcat.sh
./installTomcat.sh
