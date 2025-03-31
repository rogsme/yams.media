---
title: "Votre fichier d'environnement (.env)"
weight: 30
description: "Découvrez le fichier .env qui facilite la configuration de YAMS."
summary: "Découvrez le fichier .env utilisé pour les variables de configuration de YAMS comme les chemins d'accès ou les identifiants d'utilisateur."
---

## Votre fichier d'environnement (`.env`) - Le hub des paramètres de YAMS !

Considérez le fichier `.env` comme le panneau de contrôle pour certains paramètres majeurs de YAMS. C'est un simple fichier texte qui se trouve à l'endroit où vous avez installé YAMS (vous avez choisi cet emplacement durant les [étapes d'installation]({{< relref "/install/steps" >}}). L'emplacement par défaut est `/opt/yams`).

### Concrètement, ça sert à quoi ?

Le fichier `.env` contient des **variables d'environnement**. Cela semble technique, mais c'est juste une façon fantaisiste de dire "paramètres nommés". Vous donnez un nom à un paramètre, définissez sa valeur, et vous pouvez facilement réutiliser ce nom ailleurs.

Voici à quoi ressemble le contenu :

```env
# Les lignes commençant par # sont des commentaires (ignorés)
PUID=1000
PGID=100
MEDIA_DIRECTORY=/srv/media
# Vous pourrez ajouter vos propres variable plus tard !
# MA_CLE_API=supersecret123
```

Vous voyez ? Il suffit juste de mettre `NOM_PARAMÈTRE=valeur` sur chaque ligne. Facile !

### Comment YAMS l'utilise (la partie magique !)

Maintenant, où ces paramètres sont-ils utilisés ? Principalement dans vos fichiers `docker-compose.yaml` et `docker-compose-custom.yaml`. Ces fichiers indiquent à Docker comment exécuter tous les services YAMS (comme Radarr, Sonarr, Plex, etc.).

Au lieu d'écrire le même chemin ou ID encore et encore dans ces fichiers, nous pouvons simplement utiliser le *nom* du paramètre de `.env`, mais avec un signe de dollar (`$`) devant. Comme ceci :

```yaml
# A l'intérieur d'une définition de service dans docker-compose.yaml...
environment:
  - PUID=$PUID # Utiliser la valeur PUID de .env
  - PGID=$PGID # Et la valeur PGID aussi !
volumes:
  - $MEDIA_DIRECTORY:/data # Permet d'utiliser le dossier média défini dans le fichier .env
```

Lorsque Docker démarre le conteneur, il remplace automatiquement `$PUID` par `1000` (ou ce que vous avez défini dans `.env`), `$MEDIA_DIRECTORY` par `/srv/media`, et ainsi de suite. Sympa, non ?

### Pourquoi s'embêter avec `.env` (Spoiler : ça rend la vie plus facile !)

D'accord, mais pourquoi ajouter une étape supplémentaire ? En fait, cela vous aide de plusieurs façons :

*   **Garder les secrets secrets :** Vous avez des clés d'API ou des mots de passe ? Mettez-les dans votre fichier `.env`. De cette façon, vous pouvez partager votre fichier `docker-compose.yaml` si vous avez besoin d'aide, sans accidentellement donner des informations sensibles ! **Super Important :** Assurez-vous d'ajouter `.env` à votre fichier `.gitignore` afin de ne pas télécharger accidentellement vos secrets sur Git ! (Nous avons déjà pensé à l'ajouter pour vous).
*   **Changez une seule fois, mettez à jour partout :** Imaginez que vous déplaciez votre médiathèque. Au lieu d'éditer le chemin dans *chaque service* de votre `docker-compose.yaml`, vous changez juste la ligne `MEDIA_DIRECTORY` dans votre fichier `.env` une fois. Et voilà !
*   **Personnalisation facile :** Il permet de garder votre `docker-compose.yaml` principal plus propre et vous permet d'ajuster les paramètres de base sans avoir à fouiller dans des fichiers complexes.

### Les valeurs par défaut que YAMS fournit

Lorsque vous configurez YAMS pour la première fois, votre fichier `.env` est pré-rempli avec quelques éléments essentiels :

*   `PUID` et `PGID` : Ces nombres indiquent aux conteneurs quel utilisateur de votre ordinateur est "propriétaire" des fichiers qu'ils créent. C'est très important pour les permissions (s'assurer que Radarr peut réellement enregistrer des fichiers dans votre dossier média !) Vous n'avez généralement pas besoin de changer les valeurs par défaut (souvent `1000` pour les deux) à moins que vous ne souhaitiez faire fonctionner les choses avec un utilisateur spécifique différent.
*   `MEDIA_DIRECTORY` : Il s'agit du dossier principal de votre ordinateur où se trouvent (ou se trouveront) tous vos médias. La valeur par défaut est `/srv/media`. N'hésitez pas à le changer pour le dossier de votre choix, mais assurez-vous que l'utilisateur de `PUID`/`PGID` peut lire et écrire dans ce dossier ! **Attention:** Pour une navigation fluide et des liens efficaces (ce qui économise de l'espace disque !), essayez de garder tous vos médias (films, TV, musique, livres) dans des *sous-dossiers* sous ce *seul* répertoire principal.
*   `INSTALL_DIRECTORY` : Ce paramètre indique à YAMS l'emplacement de ses propres fichiers de configuration pour chaque service. La valeur par défaut est `/opt/yams`. Vous le définissez lors de l'installation et vous n'y toucherez probablement plus.

### Et pour les paramètres VPN ?

Bonne question ! Certaines configurations VPN s'appuient également sur des paramètres que vous pouvez mettre dans votre fichier `.env`. Pour plus de détails à ce sujet, consultez la page [Torrenting]({{< relref "/advanced/torrenting" >}}).

---

*Merci à Airwreck sur Discord pour sa contribution à ce guide !