# Dotfiles

This is most of the configuration for my machines.
It's mostly comprised of an Arch Linux system with KDE as desktop.
This is **not** meant as a template for other people.
You _can_ use this to bootstrap your system but you'll have to adapt quite a few things before and after.

## Tools

Uses [chezmoi](https://www.chezmoi.io/) with the [chezmoi_modify_manager](https://vorpalblade.github.io/chezmoi_modify_manager/index.html) plugin to manage dotfiles.
Packages are managed with [metapac](https://github.com/ripytide/metapac) and [yay](https://github.com/Jguer/yay).

Some files are encrypted, so using this repo directly requires the key.

## Bootstrapping

Install base-devel and chezmoi as root: `pacman -S chezmoi base-devel`.
Then install yay manually from the [AUR](https://aur.archlinux.org/packages/yay-bin).
Afterwards you can install the other tools: `yay -S metapac-bin chezmoi_modify_manager`.
Init chezmoi: `chezmoi init OskarCarl`.
Before you apply the dotfiles you have to remove the `encrypted_*` files from the repo since you're not me and don't have the decryption key.
To find them: `find ~/.local/share/chezmoi -name 'encrypted_*'`.
You should also configure which package groups you wish to install.
Modify `~/.local/share/chezmoi/dot_config/metapac/config.toml` to include a line for you machines hostname under `[hostname_groups]`.

Finally you can deploy stuff: `chezmoi apply` and `metapac s`

Now there's just the step of going through all the files to find items that are configured explicitly for me... have fun!
