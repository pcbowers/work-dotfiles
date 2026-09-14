#!/bin/sh

set -e

if command -v op >/dev/null 2>&1 && command -v 1password >/dev/null 2>&1; then
  exit 0
fi

printf '\n\033[1;36m── Installing 1Password + CLI ──\033[0m\n'

sudo apt-get update -q
sudo apt-get install -y curl gpg

curl -fsSL https://downloads.1password.com/linux/keys/1password.asc \
  | sudo gpg --dearmor --yes --output /usr/share/keyrings/1password-archive-keyring.gpg

sudo tee /etc/apt/sources.list.d/1password.sources > /dev/null << EOF
Types: deb
URIs: https://downloads.1password.com/linux/debian/amd64
Suites: stable
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/1password-archive-keyring.gpg
EOF

sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -fsSL https://downloads.1password.com/linux/debian/debsig/1password.pol \
  | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol > /dev/null
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -fsSL https://downloads.1password.com/linux/keys/1password.asc \
  | sudo gpg --dearmor --yes --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

sudo apt-get update -q
sudo apt-get install -y 1password 1password-cli

printf '  \033[32m✓\033[0m  1Password + CLI installed\n'

printf '
\033[1;33m┌─────────────────────────────────────────────────────────────────┐
│  ACTION REQUIRED before chezmoi can continue                    │
│                                                                 │
│  1. Open 1Password (it should be in your app launcher)         │
│  2. Sign in to your account                                     │
│  3. Go to Settings → Developer                                  │
│  4. Enable "Integrate with 1Password CLI"                       │
│  5. Come back here and press Enter to continue                  │
└─────────────────────────────────────────────────────────────────┘\033[0m
'

printf 'Press Enter once 1Password CLI integration is enabled...'
read -r _
