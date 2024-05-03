#!/bin/bash

# Mise à jour des paquets
sudo apt update

# Installation des paquets nécessaires
sudo apt install -y curl apt-transport-https ca-certificates software-properties-common

# Ajout de la clé GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Ajout du dépôt Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Mise à jour des paquets
sudo apt update

# Installation de Docker
sudo apt install -y docker-ce

# Démarrage et activation de Docker
sudo systemctl start docker
sudo systemctl enable docker

# Installation de Git
sudo apt install -y git

# Clonage du dépôt Git
git clone https://github.com/EddyGmt/challenge-myGift.git /home/ubuntu/test_cloud

# Déplacement dans le répertoire du projet
cd /home/ubuntu/test_cloud/challenge-myGift

#éxécuter les commandes docker afin de pourvoir build le projet
docker compose build --pull --no-cache

#lancer le projet via docker maintenant
docker compose up -d

# Ouvrir les ports 80 et 443 pour permettre l'accès HTTP et HTTPS
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Enregistrer les modifications dans iptables
sudo iptables-save

