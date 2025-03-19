#!/bin/bash
# Vérifier si le script est exécuté en tant que root et ne pas avoir à saisir le mot de passe plusieurs fois 
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./installNetBeans.sh"
  exit 1
fi
# Installation de NetBeans
set -e  # Arrêt immédiat en cas d'erreur

echo "Mise à jour de la base des paquets..."
apt update -y

echo "Téléchargement de NetBeans..."
cd /opt
wget https://dlcdn.apache.org/netbeans/netbeans-installers/25/apache-netbeans_25-1_all.deb

echo "Installation de NetBeans..."
apt install -y ./apache-netbeans_25-1_all.deb

echo "Nettoyage du fichier téléchargé..."
rm -f ./apache-netbeans_25-1_all.deb

echo "NetBeans installé avec succès."
