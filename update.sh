#!/usr/bin/env bash
set -euo pipefail

echo "--------------------------------------------------------------"
echo "🔄 Updating macOS Development Environment"
echo "--------------------------------------------------------------"
echo " "

export PATH=/usr/local/bin:$PATH

echo "📦 Updating Homebrew and installed packages..."
brew update
brew upgrade
brew cleanup

if command -v omz &> /dev/null; then
  echo "📺 Updating Oh My Zsh..."
  omz update
fi

if [ -d "$HOME/.pyenv" ]; then
  echo "🐍 Updating pyenv..."
  cd ~/.pyenv && git pull && cd -
fi

if command -v conda &> /dev/null; then
  echo "🐍 Updating Anaconda..."
  conda update -n base -c defaults conda -y
fi

echo
echo "-----------------------------------------------------------------------"
echo "✅ Update complete!"
echo "-----------------------------------------------------------------------"
