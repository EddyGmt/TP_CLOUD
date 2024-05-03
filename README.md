# TP CLOUD (Pour AWS)

***
Projet consistant à créer une VM depuis AWS, puis d'installer toutes les dépendances
nécessaire afin de pouvoir lancer un projet et d'y accéder en ouvrant ses ports.

## Installation
Les variables peuvent rester inchanger afin de créer la machine, cependant elle sera créée sur un de nos serveurs
directement.

* #### créer son provider afin d'y mettre ses différentes clés d'accès et la région  
* #### créer une clé ssh qui est ici "TP_CLOUD", celle ci nous permettra de nous connecter en ssh sur notre VM
* #### créer une instance ou l'on mettra le nom de notre clé ssh, le type d'ami, le type d'instance ainsi que la sécurité
* #### créer une ressource nous permettant d'ouvrir les ports afin d'accéder à la VM
* #### une nouvelle ressource afin de pouvoir se connceter sur cette machine et lui donner des instruction comme installer docker ou git par exemple
* #### Possibiité de faire un script.sh si nous avons beacoup d'instruction à lui donner, pour eviter de surcharger notre fichier main

## Variables 

Un fichier de variable a été créé afin d'éviter toute confusion sur le fichier main, ceci permettant également de changer
certtaines infos si l'on veut mettre nos propres accès AWS ou Azure pour créer d'autres VM sur son compte personnel et
voir comment cela marche.

## Commandes utiles
* Créer une paire de clé ssh avec le chemin que l'on souhaite (ici le créer dans notre projet directement)\
```ssh-keygen -t rsa -b 2048 -f ./TP_CLOUD ```

* Pour initialiser le projet terraform \
``` terraform init```\
* Vérifier s'il n'y a pas d'erreur\
``` terraform plan```\
* Lancer le projet\
``` terraform apply```\
* Supprimer les dernières ressources\
``` terraform destroy```

## Que faire après?