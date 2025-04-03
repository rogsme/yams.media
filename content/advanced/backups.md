---
title: "Sauvegardes"
date: 2025-01-15T11:50:16+02:00
draft: false
weight: 80
summary: Tout ce que vous devez savoir sur la sauvegarde et la restauration de votre installation YAMS
---

# Protégez votre configuration YAMS 💾

Votre configuration YAMS est précieuse ! Assurons-nous de bien la sauvegarder afin que vous puissiez la récupérer en cas de problème.

## Créer des sauvegardes 📦

YAMS inclut une commande de sauvegarde très pratique qui s'occupe de tout :

```bash
yams backup [destination]
```

### Exemple rapide de sauvegarde

Supposons que vous souhaitez effectuer une sauvegarde dans votre répertoire personnel :

```bash
yams backup ~/backups/
```

Vous devriez observer quelque chose comme ça :

```bash
Stopping YAMS services...

Backing up YAMS to /home/roger...
This may take a while depending on the size of your installation.
Please wait... ⌛

Backup completed! 🎉
Starting YAMS services...

Backup completed successfully! 🎉
Backup file: /home/roger/yams-backup-2024-12-23-1734966570.tar.gz
```

### Quels éléments sont sauvegardés ? 🤔

La sauvegarde inclut :

-   Toutes les configurations de vos conteneurs
-   Vos paramètres YAMS
-   Les préférences de vos services
-   Les configurations de vos conteneurs personnalisés
-   Les variables d'environnement importantes

### Astuces pour vos sauvegardes 💡

1. **Faites des sauvegardes régulièrement** : Planifiez-les de manière hebdomadaire ou mensuelles
2. **Stockez-les à plusieurs endroits** : Gardez vos sauvegardes à différents endroits
3. **Avant chaque mise à jour** : Faites toujours une sauvegarde avant de mettre à jour YAMS
4. **Contrôle de version** : Gardez vos sauvegardes récentes à portée de main
5. **Tests de restauration** : Vérifiez régulièrement que vos sauvegardes fonctionnent bien

## Restaurez vos sauvegardes 🔄

Besoin de restaurer votre installation YAMS ? Voici comment faire étape par étape :

### Étape 1 : Extraire la sauvegarde

```bash
tar -xzvf your-backup.tar.gz -C /your/new/location
cd /your/new/location
```

### Étape 2 : Mettre à jour la configuration YAMS

Éditez le binaire YAMS avec votre éditeur de code favori (nous allons utiliser `nano` mais peu importe celui que vous utilisez) :

```bash
nano yams
```

Trouvez et modifiez ces lignes :

```bash
#!/bin/bash
set -euo pipefail

# Constants
readonly DC="docker compose -f your/new/location/docker-compose.yaml -f your/new/location/docker-compose.custom.yaml"  # Modifiez cette ligne !
readonly INSTALL_DIRECTORY="your/new/location"  # Modifiez cette ligne !
```

### Étape 3 : Installez le binaire YAMS

```bash
sudo cp yams /usr/local/bin/
```

### Étape 4 : Démarrez YAMS

```bash
yams start
```

## Bonnes pratiques 📚

1. **Faire des sauvegardes régulières**

    ```bash
    # Exemple : Sauvegarde hebdomadaire à différents emplacements
    yams backup ~/backups/weekly/
    yams backup /mnt/external/yams-backup/
    ```

2. **Faire une sauvegarde avant une mise à jour**
    ```bash
    # Avant de lancer yams update
    yams backup ~/backups/pre-update/
    ```

## Dépannage 🔧

### Erreur lors de la sauvegarde ?

1. Vérifiez votre espace disque libre :
    ```bash
    df -h
    ```
2. Vérifiez vos permissions :
    ```bash
    ls -la /backup/destination
    ```
3. Tenez de stopper les services manuellement :
    ```bash
    yams stop
    ```

### Erreur lors de la restauration ?

1. Vérifiez l'intégrité de votre sauvegarde :
    ```bash
    tar -tvf your-backup.tar.gz
    ```
2. Vérifiez vos permissions
3. Assurez-vous que tous les chemins sont corrects dans le binaire de YAMS.

## Sujets avancés 🎓

### Sauvegardes automatiques

Vous pouvez automatiser vos sauvegardes en utilisant cron. Voici un exemple :

1. Ouvrez votre crontab :

    ```bash
    crontab -e
    ```

2. Ajoutez une sauvegarde hebdomadaire :
    ```bash
    # Run backup every Sunday at 2 AM
    0 2 * * 0 /usr/local/bin/yams backup /path/to/backups/
    ```

### Roulement des sauvegardes

Gardez vos sauvegardes gérables avec des roulements :

```bash
#!/bin/bash
# backup-rotate.sh
MAX_BACKUPS=5
BACKUP_DIR="/path/to/backups"

# Créé une nouvelle sauvegarde
yams backup $BACKUP_DIR

# Supprime les anciennes sauvegardes
ls -t $BACKUP_DIR/yams-backup-* | tail -n +$((MAX_BACKUPS + 1)) | xargs rm -f
```

## Besoin d'aide ? 🆘

Si vous avez rencontré un problème de sauvegarde ou restauration :

1. Visitez notre page [Problèmes courants](/faqs/common-errors/) page
2. Visitez le [Forum YAMS](https://forum.yams.media)
3. Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)

N'oubliez pas : Le meilleur moment pour faire une sauvegarde est AVANT d'en avoir besoin ! 🎯
