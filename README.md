# Script-Debian
Pour installer sur une machine Debian un environnement de développement, d’exécution et de tests de l’application ALGEM

Copiez install.sh depuis ce dépôt vers la machine cibler.
Rendez le exécutable grâce à la commande : chmod +x install.sh   
Et exécutez le avec la commande ./install.sh"

Si lors de l'installation vous désirez retrouver une machine vierge copier le script uninstall.sh.
Rendez le excécutable grâce à la commande: chmod +x uninstall.sh 
Ensuite,exécutez le avec la commande : ./uninstall.sh

Apache NetBeans - dernière version
commande qui vérifie l'installation  : dpkg -l | grep netbeans 
Git - dernière version 
commande qui vérifie l'installation : git --version
Apache - dernière version 
commande qui vérifie l'installation : apt list --installed | grep apache2
Postgresql - dernière version 
commande qui vérifie si que postgresql accepte les connexions : pg_isready
Tomcat - version 9.0.102 afin de télecharcher un version intérieur 
Il faut télercharger l'archive sur tomcat.apache.org puis l'extraire avec tar xzf et le placer dans un répertoir spécifique 
commande qui vérifie l'état du serveur : systemctl status tomcat9
