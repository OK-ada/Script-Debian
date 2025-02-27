#!/bin/bash

# Mise à jours 
apt update
apt full-upgrade
#le moteur de base de données 
apt install postgresql postgresql-client
#voir paquets disponible 
apt search postgresql