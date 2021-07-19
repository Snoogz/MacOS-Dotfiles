#!/bin/sh

echo "Starting install..."

# Change default shell to zsh
chsh -s $(grep /zsh$ /etc/shells | tail -1)

# Install oh-my-zsh if it doesn't exist
if test ! $(which omz); then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew if it doesn't exist
if test ! $(which brew); then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew receipes
brew update

# Install dependencies via Brewfile
brew tap homebrew/bundle
brew bundle

# Create Projects directory
mkdir $HOME/Projects

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source .macos

echo "Install complete!"
