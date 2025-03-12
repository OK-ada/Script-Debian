#!/bin/bash
# Script d'installation de Tomcat 9 sur Debian/Ubuntu

# Mise à jour du système
sudo apt update 

# Vérification et installation de Java si nécessaire
if ! java -version &>/dev/null; then
    echo "Java n'est pas installé. Installation en cours..."
    sudo apt install -y default-jdk
fi

# Définition des variables
TOMCAT_VERSION=$(curl -s https://downloads.apache.org/tomcat/tomcat-9/ | grep -oP '(?<=href=")[0-9]+\.[0-9]+\.[0-9]+(?=/")' | sort -V | tail -n 1)
TOMCAT_URL="https://downloads.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz"
INSTALL_DIR="/opt/tomcat9"

# Téléchargement et extraction de Tomcat 9
echo "Téléchargement de Tomcat 9 version $TOMCAT_VERSION..."
sudo wget -O /tmp/apache-tomcat9.tar.gz $TOMCAT_URL

echo "Installation de Tomcat 9..."
sudo mkdir -p $INSTALL_DIR
sudo tar -xzf /tmp/apache-tomcat9.tar.gz -C $INSTALL_DIR --strip-components=1

# Attribution des permissions
sudo chmod +x $INSTALL_DIR/bin/*.sh
sudo chown -R $USER:$USER $INSTALL_DIR

# Création du service systemd
echo "Configuration du service Tomcat 9..."
sudo tee /etc/systemd/system/tomcat9.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat 9
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

# Recharger systemd, démarrer et activer Tomcat 9
sudo systemctl daemon-reload
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

# Vérifier le statut du service
sudo systemctl status tomcat9 --no-pager

echo "Tomcat 9 version $TOMCAT_VERSION a été installé avec succès et est en cours d'exécution."



# Afficher l'adresse d'accès à l'interface d'administration
echo "Accédez à l'interface d'administration via : http://localhost:8080"

# Execution 
#chmod +x installTomcat.sh
#./installTomcat.sh
