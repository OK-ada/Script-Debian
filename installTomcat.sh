#!/bin/bash
# Mettre à jour les paquets
sudo apt update && sudo apt upgrade -y

# Installation de Java  
sudo apt install -y default-jdk

# Vérifier la version de Java
java -version

# Création du répertoire Tomcat et de l'utilisateur tomcat
sudo mkdir -p /opt/tomcat9
sudo useradd -m -d /opt/tomcat9 -U -s /bin/false tomcat

# Télécharger et installer Tomcat 9
VER=9.0.102
sudo cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-9/v${VER}/bin/apache-tomcat-${VER}.tar.gz

sudo tar xzf apache-tomcat-${VER}.tar.gz -C /opt/tomcat9 --strip-components=1

# Fixer les permissions
sudo chown -R tomcat:tomcat /opt/tomcat9
sudo chmod -R 755 /opt/tomcat9

# Créer le fichier de service systemd
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
sudo systemctl daemon-reload
sudo systemctl enable --now tomcat

# Vérifier le statut de Tomcat
sudo systemctl status tomcat --no-pager

# Afficher le message de réussite
echo "Accédez à Tomcat sur : http://localhost:8080"


# Execution 
#chmod +x installTomcat.sh
#./installTomcat.sh
