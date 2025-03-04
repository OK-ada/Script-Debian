#!/bin/bash

# Désinstallation de Git

echo "Suppression de Git..."

# Suppression du paquet Git
sudo apt remove --purge -y git

# Suppression des fichiers de configuration restants
sudo apt autoremove -y
sudo apt clean

# Suppression des configurations utilisateur de Git
rm -f ~/.gitconfig

echo "Git a été désinstallé avec succès."

# Lancer le script 
#chmod +x uninstallGit.sh
#./uninstallGit.sh
