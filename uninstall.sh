#!/bin/bash
# Script global de désinstallation (uninstall.sh)
# Doit être exécuté avec sudo : sudo ./uninstall.sh

set -e  # Arrêter immédiatement en cas d'erreur

log_file="uninstall.log"
echo "Début de la désinstallation : $(date)" > "$log_file"

uninstall() {
    script=$1
    echo "Exécution de $script..." | tee -a "$log_file"
    ./$script >> "$log_file" 2>&1
    if [ $? -ne 0 ]; then
        echo "Erreur lors de l'exécution de $script. Arrêt du script." | tee -a "$log_file"
        exit 1
    fi
}

# Exécution des scripts de désinstallation individuels avec vérification des erreurs
uninstall "uninstallNetBeans.sh"
uninstall "uninstallGit.sh"
uninstall "uninstallTomcat.sh"
uninstall "uninstallApache.sh"
uninstall "uninstallPostgres.sh"

echo "Nettoyage des fichiers temporaires..."
rm -rf /opt/apache-netbeans-*  # Suppression de NetBeans
rm -rf /etc/gitconfig  # Suppression des configs Git globales
rm -rf ~/.gitconfig  # Suppression des configs Git utilisateur
rm -rf /var/lib/postgresql  # Suppression des données PostgreSQL

echo "Toutes les désinstallations sont terminées avec succès." | tee -a "$log_file"
