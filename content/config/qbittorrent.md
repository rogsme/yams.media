---
title: "qBittorrent"
date: 2025-01-22T14:03:31+02:00
draft: false
weight: 1
summary: Le projet qBittorrent vise à fournir une alternative logicielle libre à µTorrent.
---

## Qu'est-ce que qBittorrent ?

Depuis leur [site web](https://www.qbittorrent.org/) :

> Le projet qBittorrent vise à fournir une alternative logicielle libre à µTorrent.

Tout comme µTorrent, qBitorrent est un téléchargeur de torrents. Plutôt facile ! 😎

## Configuration initiale

Tout d'abord, si vous avez configuré un VPN lors de l'installation de YAMS (ce que vous devriez vraiment faire !), qBittorrent devrait déjà être configuré pour l'utiliser. Vérifions que tout fonctionne correctement.

Dans un terminal, lancez la commande suivante :

```bash
yams check-vpn
```

Vous devriez obtenir le résultat suivant :

```bash
Getting your qBittorrent IP...
<qBittorrent IP>
Your country in qBittorrent is Brazil

Getting your IP...
<your local IP>
Your local IP country is North Korea

Your IPs are different. qBittorrent is working as expected! ✅
```

Si le test échoue, vous verrez une réponse similaire à celle ci-dessous :

```bash
Getting your qBittorrent IP...
<your local IP>
Your country in qBittorrent is North Korea

Getting your IP...
<your local IP>
Your local IP country is North Korea

Your IPs are the same! qBittorrent is NOT working! ⚠️
```

Si votre test VPN a échoué, consultez le guide [Configuration VPN](/advanced/vpn/#configuration-manuelle-) pour résoudre le problème. **Vous devez toujours utiliser un VPN lorsque vous téléchargez des torrents !**

### Mise en place de qBittorrent

Configurons maintenant qBittorrent ! Dans votre terminal, consultez les logs de qBittorrent pour obtenir vos identifiants de connexion initiaux :

```sh
docker logs qbittorrent
```

Vous verrez le nom d'utilisateur et le mot de passe de qBittorrent dans les logs :

```
qbittorrent  | ******** Information ********
qbittorrent  | To control qBittorrent, access the WebUI at: http://localhost:8081
qbittorrent  | The WebUI administrator username is: admin
qbittorrent  | The WebUI administrator password was not set. A temporary password is provided for this session: FBFsKbfbD
qbittorrent  | You should set your own password in program preferences.
qbittorrent  | Connection to localhost (::1) 8081 port [tcp/tproxy] succeeded!
```

Depuis votre nagicateur, allez à l'adresse [http://{votre-adresse-ip}:8081/](). Vous arriverez sur la page d'administration de qBittorrent. Connectez-vous avec :

```sh
username: admin
password: votre-mot-de-passe-temporaire-trouvé-dans-les-logs
```

[![qbittorrent-1](/pics/qbittorrent-1.png)](/pics/qbittorrent-1.png)

Après vous être connecté, vous verrez la page d'accueil vide de qBittorrent. Cliquez sur l'engrenage en haut à droite pour accéder aux paramètres.

[![qbittorrent-2](/pics/qbittorrent-2.png)](/pics/qbittorrent-2.png)

### Configuration des paramètres BitTorrent

Tout d'abord, allez dans l'onglet "Downloads" et entrez `/data/downloads/torrents/` dans "Default Save Path".

[![qbittorrent-8](/pics/qbittorrent-8.png)](/pics/qbittorrent-8.png)

Ensuite, allez dans l'onglet "BitTorrent" et cochez la case "When ratio reaches". Réglez-la sur 0.

### Est-ce que c'est un comportement de merde ?

Oui. 😅

Le protocole BitTorrent fonctionne par partage (seeding) de fichiers sur le réseau. Fixer la limite d'ensemencement à zéro signifie "Je partage le torrent **jusqu'à** ce que j'aie fini de télécharger". Vous continuerez à le partager pendant le téléchargement, mais une fois terminé, le torrent s'arrête et attend que [Sonarr](/config/sonarr)/[Radarr](/config/radarr) le récupère.

Pour ce tutoriel, nous le laisserons à 0, mais n'hésitez pas à être moins égoïste plus tard !

**Certains services de torrents surveillent le ratio afin d'éviter les abus et restreignent les comptes ayant un ratio trop faible. Assurez-vous de respecter ces contraintes pour conserver vos accès à ces plateformes**

[![qbittorrent-3](/pics/qbittorrent-3.png)](/pics/qbittorrent-3.png)

### Configuration des paramètres de l'interface Web

Ensuite, allez dans l'onglet "Web UI". Ici, vous pouvez configurer l'application pour qu'elle ignore l'authentification par mot de passe lors de l'accès à partir de votre réseau local. Cette option est facultative mais recommandée.

[![qbittorreft-4](/pics/qbittorrent-4.png)](/pics/qbittorrent-4.png)

Pendant que vous êtes ici, changez votre mot de passe temporaire pour un mot de passe plus fort :

[![qbittorreft-7](/pics/qbittorrent-7.png)](/pics/qbittorrent-7.png)

### Configuration des paramètres du réseau

Dans l'onglet "Advanced", assurez-vous que votre interface réseau est définie sur `tun0`. Cela garantit que qBittorrent utilise toujours la connexion VPN et s'arrête si le VPN dysfonctionne.

[![qbittorreft-5](/pics/qbittorrent-5.png)](/pics/qbittorrent-5.png)

Enfin, descendez en bas de la fenêtre et cliquez sur "Save".

[![qbittorreft-6](/pics/qbittorrent-6.png)](/pics/qbittorrent-6.png)

### Redirection de port 🚀

Envie de télécharger plus rapidement vos contenus ? YAMS supporte nativement la redirection de port ! Consultez notre guide sur la [Redirection de port](/advanced/port-forwarding/) pour booster votre vitesse de téléchargement.

[![qbittorrent-ports](/pics/advanced-port-forwarding-1.png)](/pics/advanced-port-forwarding-1.png)

## Vérification finale du VPN

Effectuons une dernière vérification du VPN pour nous assurer que tout fonctionne correctement :

```bash
$ yams check-vpn
```

Vous devriez voir que l'adress IP utilisée par qBittorrent est différente de votre adresse IP locale. Si ce n'est pas le cas, consultez le guide [Configuration VPN](/advanced/vpn/#configuration-manuelle-) pour résoudre le problème.

## Et voilà ! 🎉

Nous pouvons maintenant poursuivre avec [SABnzbd](/config/sabnzbd).
