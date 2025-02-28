#!/bin/bash

# installation de netbeans 

#Mise a jour de la base des paquets 
sudo apt update -y 

#Aller dans le dossier opt
cd /opt 

#recuperer netbeans sur le site officiel 
sudo wget https://dlcdn.apache.org/netbeans/netbeans-installers/25/apache-netbeans_25-1_all.deb
 
sudo apt install ./apache-netbeans_25-1_all.deb 


