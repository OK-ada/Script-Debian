#!/bin/bash

# Script global d'installation (install.sh)
# Ce script doit être exécuté avec sudo : sudo ./install.sh

set -e  # Arrêter le script en cas d'erreur

log_file="install.log"
echo "Début de l'installation : $(date)" > "$log_file"

install() {
    script=$1
    echo "Exécution de $script..." | tee -a "$log_file"
    ./$script >> "$log_file" 2>&1
    if [ $? -ne 0 ]; then
        echo "Erreur lors de l'exécution de $script. Arrêt du script." | tee -a "$log_file"
        exit 1
    fi
}

# Mise à jour initiale (une seule fois)
echo "Mise à jour du système..." | tee -a "$log_file"
apt update >> "$log_file" 2>&1

# Exécution des scripts d'installation individuels avec contrôle d'erreur
install "installTomcat.sh"
install "installNetBeans.sh"
install "installGit.sh"
install "installApache.sh"
install "installPostgres.sh"

echo "Toutes les installations sont terminées avec succès." | tee -a "$log_file"
