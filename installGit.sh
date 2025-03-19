#!/bin/bash
# Vérifier si le script est exécuté en tant que root et ne pas avoir à saisir le mot de passe plusieurs fois 
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./installGit.sh"
  exit 1
fi
# Installation de Git
set -e # Arrêt immédiat en cas d'erreur

echo "Mise à jour des paquets..."
apt update -y

echo "Installation de Git..."
apt install -y git

echo "Vérification de la version installée..."
git --version

echo "Configuration de Git..."
git config --global user.name "devel"
git config --global user.email "devel@algem.org"

echo "Paramètres configurés :"
git config --list

echo "Git installé avec succès."
