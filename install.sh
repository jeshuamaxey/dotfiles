#!/bin/sh

# Ask for the administrator password upfront
sudo -v

echo "installing apps and utils with homebrew..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

echo "brew installs done."

echo "installing node version manager (nvm)..."
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"

echo "nvm installed."

# install useful npm packages globally
echo "installing apps and utils with npm..."

npm i -g nodemon

echo "npm installs done."

# must go last
# install glcoud sdk
echo "Downloading gcloud-sdk..."

curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-171.0.0-darwin-x86_64.tar.gz -o ~/code/gcloud-sdk.tar.gz
tar zxvf ~/code/gcloud-sdk.tar.gz -C ~/code/

echo ""
echo "+-------------------------------------------+"
echo "| gcloud-sdk downloaded                     |"
echo "| to install, run:                          |"
echo "| ~/code/google-cloud-sdk/install.sh        |"
echo "+-------------------------------------------+"
echo ""
