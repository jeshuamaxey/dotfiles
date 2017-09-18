# Jeshua Maxey's Dotfiles

## Setting up a new machine

1. Update OS X to the latest version with the App Store
1. Install Xcode from the App Store, open it and accept the license agreement
1. Install OS X Command Line Tools by running `xcode-select --install`
1. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
1. Clone this repo to `~/.dotfiles`
1. Run `./osx.sh` to set Mac OS X settings
1. Run `./git-creds.sh` to set git credentials (NB: this file isn't tracked, but an example of it is)
1. Run `./init.sh` to create symlinks to dotfiles
1. Run `./install.sh` to start the installation
1. [Install the remaining apps](./apps.md)
1. Make sure Google Backup and Sync is set up
1. Restore preferences by running `mackup restore`
1. Restart your computer to finalize the process

## Credit to

* https://github.com/driesvints/dotfiles
 
