# work-dotfiles

These dotfiles are managed using [chezmoi](https://www.chezmoi.io/).

### Install

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