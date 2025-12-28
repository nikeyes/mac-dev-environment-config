#!/usr/bin/env bash
set -euo pipefail

brew install "zsh"

echo "You have configured: $SHELL"

if ! [[ "$SHELL" == /bin/zsh ]]; then
   chsh -s /bin/zsh
fi  

ZSH_CONFIG=$(cat ./zsh/.zshrc)
if ! grep -qF "$ZSH_CONFIG" ~/.zshrc; then
  echo $ZSH_CONFIG >> ~/.zshrc
fi

brew install "fzf"
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

FZF_CONFIG="export FZF_DEFAULT_OPTS=\"--height 40% --layout reverse --info inline --border --preview 'cat {}'\""
if ! grep -qF "$FZF_CONFIG" ~/.zshrc; then
  echo $FZF_CONFIG >> ~/.zshrc
fi

brew install "tldr"