#!/bin/bash
# Vérifier si le script est exécuté en tant que root et ne pas avoir à saisir le mot de passe plusieurs fois 
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./installPostgres.sh"
  exit 1
fi
# Mise à jours 
echo "Mise à jour des paquets..."
apt update
# Installation 
echo "Installation de Postgres..."
apt install postgresql postgresql-client postgresql-contrib

# Si le service n’est pas démarré ni activé au démarrage
echo "Activation du service Postgres..."
systemctl enable --now postgresql
# Pour connaitre le status 
echo "Le status de Postgres..."
systemctl status postgresql