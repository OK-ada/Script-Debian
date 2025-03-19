#!/bin/bash
# Vérifier si le script est exécuté en tant que root et ne pas avoir à saisir le mot de passe plusieurs fois 
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./installApache.sh"
  exit 1
fi
# Installation de Apache 
set -e  # Arrêt immédiat en cas d'erreur
echo "Arret de la lecture du script en cas d'erreur"

#Mise à jour système
echo "Mise à jour de la base des paquets..."
apt update

echo "Installation de Apache..."
apt install apache2
# Démarage 
echo "Apache est désormais installé et démarré."
service apache2 start
systemctl start apache2

#Vérifier le statuts
echo "Vérification du statut d'Apache..."
systemctl status apache2
