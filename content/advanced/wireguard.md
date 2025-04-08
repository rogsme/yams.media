---
title: "Configurer Gluetun avec WireGuard"
date: 2025-04-05T12:00:00-03:00
draft: false
weight: 55
summary: Apprenez comment passer du protocole OpenVPN à WireGuard avec Gluetun pour connexion plus fiable et plus rapide.
---

Vous voulez des vitesses VPN plus rapides et des temps de connexion plus courts ? Il est temps de passer d'OpenVPN à **WireGuard** ! Ce guide vous guidera dans la mise à jour de votre configuration Gluetun pour utiliser WireGuard - avec un focus sur **ProtonVPN**.


> ✅ **Pourquoi changer ?** WireGuard est un protocole VPN moderne, plus rapide, plus efficace et plus simple à configurer qu'OpenVPN.

---

## Pour les utilisateurs de ProtonVPN 🚀

ProtonVPN facilite l'utilisation de WireGuard avec Gluetun. Voici comment mettre à jour votre configuration.

### Étape 1 : Obtenez votre clé privée WireGuard 🔑

1. Allez sur le [Générateur de congifguration WireGuard de ProtonVPN](https://account.proton.me/u/0/vpn/WireGuard)
2. Sélectionnez un serveur et activez la **redirection de port** et le **NAT modéré** (optionnel)
3. Cliquez sur **Télécharger** pour obtenir le fichier `.conf`
4. Ouvrez ce fichier et copiez la valeur de `PrivateKey`

Cela devrait ressembler à ça :
```
PrivateKey = wOEI9rqqbDwnN8/Bpp22sVz48T71vJ4fYmFWujulwUU=
```

---

### Étape 2 : Mettez à jour votre fichier `.env` 🛠️

Ouvrez votre fichier `.env` et retirez les identifiants OpenVPN :

```bash
nano /opt/yams/.env
```

Retirez ou commentez :
```env
VPN_USER=votre-nom-d-utilisateur
VPN_PASSWORD=votre-mot-de-passe
```

Vous pouvez aussi retirer `VPN_SERVICE=protonvpn` si vous souhaitez le mettre en brut dans le fichier compose (voir plus bas), ou le laisser. Les deux fonctionnent.

> 💡 Pas sûr de savoir comment fonctionne le fichier `.env` ? Consultez notre guide [Votre fichier d'environnement](/advanced/env-file/) pour apprendre comment gérer des variables telles que `WIREGUARD_PRIVATE_KEY` de manière sécurisée.

---

### Étape 3 : Mettez à jour `docker-compose.yaml` 🐳

Trouvez le service `gluetun` et remplacez la section `environment` avec les informations suivantes (en utilisant votre clé privée WireGuard):

```yaml
environment:
  - VPN_SERVICE_PROVIDER=protonvpn
  - VPN_TYPE=wireguard
  - WIREGUARD_PRIVATE_KEY=wOEI9rqqbDwnN8/Bpp22sVz48T71vJ4fYmFWujulwUU=
  - VPN_PORT_FORWARDING=on
  - VPN_PORT_FORWARDING_PROVIDER=protonvpn
  - PORT_FORWARD_ONLY=on
```

> 🧠 **Astuce :** Vous pouvez utiliser la syntaxe `${VARIABLE}` si vous souhaitez mettre votre clé privée dans le fichier `.env`. Consultez le guide [Votre fichier d'environnement](/advanced/env-file/) pour plus d'informations.

---

### Étape 4 : Redémarrez YAMS 🔄

Appliquez les changements :

```bash
yams restart
```

---

### Étape 5 : Vérifiez que ça fonctionne ✅

Vérifiez que le VPN fonctionne :

```bash
yams check-vpn
```

Vous devriez voir que votre IP qBittorrent est différente de votre IP locale et située dans le pays que vous avez sélectionné dans ProtonVPN.

Vous pouvez également vérifier les journaux de logs de Gluetun :

```bash
docker logs gluetun
```

Cherchez les lignes suivantes :

```
Using VPN provider: protonvpn
VPN type: wireguard
Port forwarding is enabled
```

---

## Pour les autres fournisseurs VPN 🌐

WireGuard est supporté par de nombreux fournisseurs. Voici les étapes à réaliser :

1. Visitez la [Documentation Fournisseurs VPN de Gluetun](https://github.com/qdm12/gluetun-wiki/tree/main/setup/providers)
2. Trouvez votre fournisseur VPN et suivez leurs instructions pour WireGuard
3. Remplacez en conséquence les variables d'environnement `gluetun` dans votre `docker-compose.yaml`

> ⚠️ Tous les fournissseurs ne supportent pas WireGuard ou la redirection de port. Consultez attentivement leur documentation.

---

## Dépannage 🔧

### Gluetun ne démarre pas ?
- Revérifiez votre `WIREGUARD_PRIVATE_KEY`
- Assurez-vous que `VPN_TYPE=wireguard` est bien présent
- Cherchez les éventuelles erreurs, fautes de frappes ou espaces en trop dans votre `docker-compose.yaml`

### La redirection de port ne fonctionne pas ?
- Assurez-vous que `VPN_PORT_FORWARDING=on` et `PORT_FORWARD_ONLY=on` sont présents
- Vérifiez que la redirection de port est activée dans votre configuration ProtonVPN
- Consultez les journaux d'erreurs de Gluetun pour la redirection de port

---

## Besoin d'aide ? 🆘

Si vous êtes bloqué :
- Visitez notre page [Problèmes courants](/faqs/common-errors/)
- Visitez le [Forum YAMS](https://forum.yams.media)
- Rejoignez notre serveur [Discord](https://discord.gg/Gwae3tNMST) ou [Matrix](https://matrix.to/#/#yams-space:rogs.me)