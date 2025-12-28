#!/usr/bin/env bash
set -euo pipefail

brew install "git"
brew install "gh"
brew install "git-delta"
brew install "docx2txt"
brew install "git-lfs"

gcp --backup=numbered ./git/gitconfig "$HOME"/.gitconfig
gcp --backup=numbered ./git/gitignore_global "$HOME"/.gitignore_global
gcp --backup=numbered ./git/gitattributes "$HOME"/.gitattributes

mkdir -p "$HOME"/bash_functions
gcp --backup=numbered ./git/git-* "$HOME"/bash_functions/
chmod +x "$HOME"/bash_functions/git-*


BASH_FUNC_PATH="export PATH=\$PATH:\$HOME/bash_functions/"
if ! grep -qF "$BASH_FUNC_PATH" "$HOME"/.zshrc; then
  echo "$BASH_FUNC_PATH" >> "$HOME"/.zshrc
fi

read -rp "✉️ What is your email? " git_email
read -rp "👤 And your name? " git_name

git config --global user.email "$git_email"
git config --global user.name "$git_name"

echo "🔑 Setting up SSH key for GitHub"
set +e
ssh-keygen -t ed25519 -C "$git_email"
set -e

eval "$(ssh-agent -s)"

if ! [[ -f "$HOME/.ssh/config" ]]; then
    mkdir -p "$HOME"/.ssh
    touch "$HOME"/.ssh/config
fi
ssh-add -K "$HOME"/.ssh/id_ed25519
pbcopy < "$HOME"/.ssh/id_ed25519.pub

# GitHub Enterprise Setup (Optional)
echo "📝 SSH public key copied to clipboard"
read -rp "Do you use GitHub Enterprise? [y/N] " -n 1 use_ghe
echo

if [[ $use_ghe =~ ^[Yy]$ ]]; then
  read -rp "Enter your GitHub Enterprise URL (e.g., github.company.com): " ghe_url
  echo "🟨 Opening GitHub Enterprise to add SSH key"
  open -a "/Applications/Google Chrome.app" "https://${ghe_url}/settings/ssh/new"
  read -rp "👀 Press enter after adding SSH key..." not_needed
  echo "👁‍🗨 Testing connection to GitHub Enterprise"
  set +e
  ssh -T git@${ghe_url}
  set -e
else
  echo "🟨 Add SSH key to GitHub: https://github.com/settings/keys"
  read -rp "👀 Press enter after adding SSH key..." not_needed
  echo "👁‍🗨 Testing connection to GitHub"
  set +e
  ssh -T git@github.com
  set -e
fi
