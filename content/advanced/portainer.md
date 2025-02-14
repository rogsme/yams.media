---
title: "Portainer"
date: 2025-01-15T11:50:16+02:00
draft: false
weight: 7
summary: Votre centre de commande pour tous vos conteneurs YAMS
---

# Qu'est-ce que Portainer ? 🐋

Pensez à Portainer comme étant votre centre de commande pour Docker ! Il vous offre une interface web élégante pour gérer tous vos conteneurs, rendant la tâche beaucoup plus facile que de taper des commandes dans le terminal toute la journée.

Depuis leur [site Web](https://www.portainer.io/):

> Déployez, configurez, dépannez et sécurisez les conteneurs en quelques minutes sur Kubernetes, Docker, Swarm et Nomad, dans n'importe quel centre de données, cloud, bord de réseau ou appareil IoT.

Portainer est facultatif dans YAMS, mais nous le recommandons vivement. C'est comme avoir une vision aux rayons X de vos conteneurs ! 🦸‍♂️

## Configuration initiale 🚀

### Étape 1: Accéder à Portainer

Ouvrez votre navigateur et allez sur `http://{votre-adresse-ip}:9000/`. Vous allez voir les instructions de première connexion.

### Étape 2: Création d'un compte administrateur

Configurons vos accès administrateurs :

1. Choisissez un nom d'utilisateur sécurisé
2. Choisissez un mot de passe fort
3. Cliquez sur "Create User"

[![Portainer setup](/pics/portainer-1.png)](/pics/portainer-1.png)

### Étape 3: Mise en place rapide

Sur l'écran "Quick Setup" :

1. Cliquez sur "Get Started", cela initialisera Portainer avec les paramètres par défaut adéquats
2. Pas besoin de toucher aux paramètres avancés pour l'instant

[![Quick setup](/pics/portainer-2.png)](/pics/portainer-2.png)

### Étape 4: Accédez à votre environnement

1. Cliquez sur votre environnement Docker "local"
2. C'est là que la magie opère !

[![Local environment](/pics/portainer-3.png)](/pics/portainer-3.png)

## Administrez vos conteneurs 🎮

### Consulter les conteneurs

1. Cliquez sur "Containers" sur le menu latéral gauche
2. Vous verrez ici tous les services YAMS en cours d'exécution

[![Container list](/pics/portainer-4.png)](/pics/portainer-4.png)

### Ce que vous pouvez faire ici

-   👀 Suivre le statut de vos conteneurs
-   🔄 Redémarrer des services
-   📊 Vérifier l'utilisation des ressources
-   📝 Voir les logs
-   ⚙️ Modifier les paramètres des conteneurs

[![Container details](/pics/portainer-5.png)](/pics/portainer-5.png)

## Astuces 💡

### 1. Gestion des conteneurs

-   **Redémarrage rapide** : Utilisez l'icône d'actualisation se trouvant à côté d'un conteneur
-   **Action par lot** : Sélectionnez plusieurs conteneurs pour les redémarrer/arrêter d'un seul clic
-   **Rafraîchissement automatique** : Activez le rafraîchissement automatique pour suivre vos conteneurs en temps réel

### 2. Logs et dépannage

-   Voir les logs de vos conteneurs directement depuis Portainer
-   Suivre l'utilisation des ressources de vos conteneurs
-   Inspecter la configuration de vos conteneurs quand des choses ne fonctionnent pas

### 3. Suivi des ressources

-   Suivre l'utilisation du CPU et de la mémoire RAM
-   Inspecter le trafic réseau
-   Mettre en place des restrictions de ressources si nécessaire

## Fonctionnalités pratiques à essayer 🌟

1. **Console des conteneurs**

    - Accédez au terminal d'un conteneur directement depuis le web
    - Pratique pour débugger rapidement

2. **Statistiques en temps réel**

    - Suivez l'utilisation du CPU, de la RAM et du réseau
    - Parfait pour détecter les soucis de performance

3. **Gestion des volumes**

    - Vérifiez où vos données sont stockées
    - Gérez le stockage persistant

4. **Gestion des réseaux**
    - Regardez comment vos conteneurs sont interconnectés
    - Dépannez les soucis de réseaux

## Bonnes pratiques 📚

1. **Sécurité**

    - Mettez à jour régulièrement le mot de passe administrateur
    - Utilisez un mot de passe fort
    - N'exposez pas Portainer sur internet

2. **Supervision**

    - Vérifiez les logs de vos conteneurs régulièrement
    - Suivez l'utilisation de vos ressources
    - Mettez en place l'envoi d'alertes par email en cas de défaillance d'un conteneur

3. **Maintenance**
    - Redémarrez les conteneurs gracieusement
    - Utilisez l'option "Recreate" lors d'une mise à jour
    - Gardez un œil sur l'espace disque

## Dépannage 🔧

### Vous n'arrivez pas à accéder à Portainer ?

1. Vérifiez si le conteneur est en cours d'exécution :
    ```bash
    yams check portainer
    ```
2. Vérifiez que le port ne soit pas bloqué ou déjà utilisé
3. Assurez-vous d'utiliser la bonne adresse IP

### Soucis de conteneurs ?

1. Vérifiez les logs du conteneur dans Portainer
2. Cherchez les messages d'erreur
3. Vérifiez les paramètres du conteneur

### Soucis de ressources ?

1. Suivez les statistiques d'un conteneur
2. Vérifiez les ressources du système hôte
3. Considérez la mise en place de limites d'utilisation des ressources

## Besoin d'aide ? 🆘

Si vous êtes bloqué :

1. Visitez notre page [Problèmes courants](/faqs/common-errors/)
2. Visitez le [Forum YAMS](https://forum.yams.media)
3. Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)
4. Consultez la [documentation de Portainer](https://docs.portainer.io/)

N'oubliez pas : Portainer est votre ami ! Il facilite grandement la gestion de YAMS, alors prenez le temps d'explorer ses fonctionnalités. 🎮
