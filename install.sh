#!/bin/sh

# Ask for the administrator password upfront
sudo -v


# Check for Homebrew and install if we don't have it
# if test ! $(which brew); then
#   echo "installing oh my zsh"
#   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi

echo "installing apps and utils with homebrew..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "installing homebrew first"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

echo "brew installs done."
echo ""
echo "+---------------------------------------------------+"
echo "| to install skyfonts, run the installer at:        |"
echo "| /usr/local/Caskroom/skyfonts/5.9.1.0/SkyFonts.app |"
echo "+---------------------------------------------------+"
echo ""


# install useful npm packages globally
echo "installing apps and utils with npm..."

npm i -g yarn nodemon

echo "npm installs done."
