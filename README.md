# Jeshua Maxey's Dotfiles

## Setting up a new machine

1. Update OS X to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install OS X Command Line Tools by running `xcode-select --install`
4. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/bin/zsh` to the end of your `/etc/shells` file
7. Run `init.sh` to create symlinks to dotfiles
8. Run `install.sh` to start the installation
9. Make sure Google Drive is set up and synced
10. [Install the remaining apps](./apps.md)
11. Restore preferences by running `mackup restore`
12. Restart your computer to finalize the process

## Credit to

* https://github.com/driesvints/dotfiles
 