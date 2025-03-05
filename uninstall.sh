
#!/bin/bash

# Script global de désinstallation (uninstall.sh)
# Ce script doit être exécuté avec sudo : sudo ./uninstall.sh

# Exécution des scripts de désinstallation individuels
./uninstallTomcat.sh
./uninstallNetBeans.sh
./uninstallGit.sh
./uninstallApache.sh
./uninstallPostgres.sh

echo "Toutes les désinstallations sont terminées, la machine est revenue à son état initial."
