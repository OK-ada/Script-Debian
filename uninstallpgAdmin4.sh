#!/bin/bash

# Vérifier si le script est exécuté en tant que root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script avec sudo: sudo ./uninstall_pgadmin4.sh"
  exit 1
fi

# Arrêter le service Apache (si utilisé pour pgAdmin4)
systemctl stop apache2
systemctl disable apache2

# Supprimer pgAdmin4 et ses dépendances
apt remove -y pgadmin4 pgadmin4-web pgadmin4-desktop
apt autoremove -y

# Supprimer le dépôt et la clé GPG
rm -f /etc/apt/sources.list.d/pgadmin4.list
rm -f /usr/share/keyrings/packages-pgadmin-org.gpg

# Supprimer les fichiers de configuration restants
rm -rf /var/lib/pgadmin /var/log/pgadmin /etc/pgadmin

# Mise à jour des paquets
apt update

# Message de confirmation
echo "pgAdmin4 a été complètement désinstallé."
