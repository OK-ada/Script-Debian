#!/bin/bash

# Script global d'installation (install.sh)
# Ce script doit être exécuté avec sudo : sudo ./install.sh pour ne pas demander plusieurs fois le mot de passe


# Mise à jour du système (une seule fois)
apt update -y

# Exécution des scripts d'installation individuels
./installPostgres.sh
./installApache.sh
./installGit.sh
./installNetBeans.sh
./installTomcat.sh

echo "Toutes les installations sont terminées avec succès."
