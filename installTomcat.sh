#!/bin/bash


# Mettre à jour les paquets
sudo apt update
#Installation de Java  
sudo apt install default-jdk
# Voir la version de Java
java -version
#Création de l'user 
useradd -r -d /opt/tomcat9 -s /bin/false tomcat
mkdir /opt/tomcat9
# Téléchargement et installation de Tomcat 9 rechercher dans les archives 
VER=9.0.102
wget https://dlcdn.apache.org/tomcat/tomcat-9/v${VER}/bin/apache-tomcat-${VER}.tar.gz

#Extrayez le binaire Apache Tomcat 9 dans le répertoire /opt/tomcat9 .
tar xzf apache-tomcat-${VER}.tar.gz -C /opt/tomcat9 --strip-components=1

#Confirmez le contenu du répertoire personnel d’Apache Tomcat 
ls -alh1 /opt/tomcat9/
#Assurez-vous que l'utilisateur Tomcat possède les répertoires, work , temp , webapps et logs
chown -R tomcat: /opt/tomcat9/{logs,temp,webapps,work}
chown -R :tomcat /opt/tomcat9/
# autorisation 
chmod -R g+r /opt/tomcat9/conf
chmod g+x /opt/tomcat9/conf
# Configuration 
echo 'export CATALINA_HOME="/opt/tomcat9"' > /etc/profile.d/tomcat9.sh

update-java-alternatives -l
java-1.17.0-openjdk-amd64      1711       /usr/lib/jvm/java-1.17.0-openjdk-amd64
echo 'export JAVA_HOME=" /usr/lib/jvm/java-1.17.0-openjdk-amd64 "' >> /etc/profile.d/tomcat9.sh
source /etc/profile.d/tomcat9.sh
#lancer Tomcat9
opt/tomcat9/bin/startup.sh
# Afficher le message de réussite
echo "Accédez à l'interface d'administration sur : http://localhost:8080 (nécessite configuration des utilisateurs)"

# Execution 
#chmod +x installTomcat.sh
#./installTomcat.sh
