#!/bin/bash

# Mise à jour des packages et installation des dépendances nécessaires
echo "Mise à jour des packages..."
sudo apt update -y

# Installation de Docker
echo "Installation de Docker..."
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Vérification de l'installation de Docker
echo "Vérification de l'installation de Docker..."
sudo systemctl enable docker
sudo systemctl start docker
sudo docker --version

# Installation de Ansible
echo "Installation de Ansible..."
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Vérification de l'installation d'Ansible
echo "Vérification de l'installation d'Ansible..."
ansible --version

# Installation de Tree
echo "Installation de Tree..."
sudo apt install -y tree

# Vérification de l'installation de Tree
echo "Vérification de l'installation de Tree..."
tree --version

# Installation de docker-compose
echo "Installation de docker-compose..."
sudo apt install -y docker-compose

# Installation de python3-setuptools
echo "Installation de python3-setuptools..."
sudo apt install -y python3-setuptools

# Configuration du pare-feu pour autoriser les connexions au serveur Minecraft
echo "Configuration du pare-feu..."
sudo ufw allow 25565/tcp
sudo ufw enable

# Affichage de l'IP publique pour que les joueurs puissent se connecter
echo "Votre IP publique est :"
curl ifconfig.me
echo -e "\nDonnez cette IP aux joueurs pour qu'ils puissent se connecter."

echo "Installation et configuration terminées."
