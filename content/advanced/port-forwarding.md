---
title: "Redirection de port"
date: 2025-01-15T11:50:16+02:00
draft: false
weight: 3
summary: Tout ce que vous devez savoir au sujet de la configuration d'un VPN avec YAMS
---

La redirection de port vous permet d'obtenir des débits de téléchargement plus élevés en autorisant les connexions entrantes vers votre client torrent. YAMS active la redirection de port par défaut, mais la configuration varie selon votre fournisseur VPN.

## Utilisateurs ProtonVPN 🚀

ProtonVPN facilite la redirection de port ! Suivez simplement ces étapes :

1. Créez un script pour mettre à jour le port de qBittorrent. Assurez-vous de bien remplacer `/your/install/location` par le chemin de votre installation :

```bash
mkdir -p /your/install/location/scripts
nano /your/install/location/scripts/update-port.sh
```

2. Ajoutez ce code au script : https://gitlab.com/-/snippets/4788387. Assurez-vous de modifier le code pour qu'il corresponde à votre propre configuration.

```bash
QBITTORRENT_USER=admin            # identifiant qbittorrent
QBITTORRENT_PASS=adminadmin       # mot de passe qbittorrent
```

3. Rendez le script exécutable

```bash
chmod +x /your/install/location/scripts/update-port.sh
```

4. Lancez le script pour vous assurez que tout fonctionne

```bash
./your/install/location/scripts/update-port.sh
```

Vous devriez voir le résultat suivant :

```bash
2024-12-30 08:21:58 | VPN container gluetun in healthy state!
2024-12-30 08:21:58 | qBittorrent Cookie invalid, getting new SessionID
2024-12-30 08:21:58 | Public IP: 111.111.111.111
2024-12-30 08:21:58 | Configured Port: 61009
2024-12-30 08:21:58 | Active Port: 61009
2024-12-30 08:21:58 | Port OK (Act: 61009 Cfg: 61009)
```

5. Mettez en place un changement automatique de port (toutes les 5 minutes) :

```bash
(crontab -l 2>/dev/null; echo "*/5 * * * * /your/install/location/scripts/update-port.sh") | crontab -
```

## Autres fournisseurs VPN 🌐

Pour les autres fournisseurs VPN, la configuration de la redirection de port varie.

Pour des instructions spécifiques à chaque fournisseur, consultez la [Documentation de Gluetun sur la redirection de port](https://github.com/qdm12/gluetun-wiki/blob/main/setup/advanced/vpn-port-forwarding.md).

## Vérifier le fonctionnement de la redirection de port ✅

Pour s'assurer que la redirection de port fonctionne :

1. Lancez la commande `curl http://localhost:8003/v1/openvpn/portforwarded` dans votre terminal pour voir votre port actuel.
2. Visitez le site [Open Port Check Tool](https://www.yougetsignal.com/tools/open-ports/) et testez votre port en utilisant l'adresse IP publique de votre VPN ainsi que le port actif
3. Vérifiez le statut de connexion de qBittorrent. Il devrait afficher "Connection Status: Connected"

[![conection-status](/pics/advanced-port-forwarding-1.png)](/pics/advanced-port-forwarding-1.png)

## Dépannage 🔧

1. **Pas de port affiché :**

    ```bash
    docker logs gluetun | grep "\[port forwarding\]"
    ```

    Regardez les messages d'erreurs affichés

2. **Le port ne se met pas à jour :**
    - Vérifiez si le script a les permissions d'exécution
    - Vérifiez si crontab est lancé : `crontab -l`
    - Vérifiez les logs du script : `tail -f /var/log/syslog | grep update-port`

Besoin d'aide ? Visitez notre page [Problèmes courants](/faqs/common-errors/) ou rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me) !
