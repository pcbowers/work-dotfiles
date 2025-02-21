# work-dotfiles

These dotfiles are managed using [chezmoi](https://www.chezmoi.io/).

## Install

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply pcbowers/work-dotfiles --ssh
```

## Update

```sh
chezmoi update -v
```

## Upgrade

```sh
chezmoi upgrade
```

## Requirements

- A flavor of `Debian` (i.e. `Ubuntu`) is used
- `bash` is installed
- `git` is installed
- `1password` is installed

To help, here's a script you can paste into your terminal:

```sh
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    
    sudo apt update && sudo apt install -y 1password 1password-cli git-all
```

You may need to enable the SSH agent in 1password along with its CLI integration.

## Manual Steps

- This does not install the `tnsnames.ora` file to `Oracle/tnsnames.ora` for you. You'll need to do that manually (see wiki [here](https://wiki.os.liberty.edu/display/CARD/Dev+Ubuntu+Installation+Setup))
- While it does install `google-chrome`, you'll need to manually install the Teams, Outlook, and Spotify PWAs
- While it does install `vs-code`, you'll need to manually enable syncing to the `pcbowers` GitHub account
- You'll most likely have to reach out to the Sys Ops team regarding the puppet/Microsoft Defender installations with your computer name. You'll also need [this](https://wiki.os.liberty.edu/display/CARD/Dev+Ubuntu+Installation+Setup) to get the Microsoft Defender downloads.
- This does not install Pano, my clipboard manager of choice. You'll need to install it manually (see [here](https://github.com/oae/gnome-shell-pano)). I do install the Extension Manager for you though.
- This does not install Emoji Copy, my emoji picker of choice. You'll need to install it manually (see [here](https://github.com/felipeftn/emoji-copy)). I do install the Extension Manager for you though.
- I also don't install IntelliJ Toolbox directly for you since it requires a version and a license key, which is easier to just install from the JetBrains website (see [here](https://www.jetbrains.com/help/idea/installation-guide.html)