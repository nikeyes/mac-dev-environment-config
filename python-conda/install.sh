#!/usr/bin/env bash
set -euo pipefail

brew install cask "anaconda"
export PATH=/usr/local/anaconda3/bin:$PATH
if ! grep -qF 'export PATH=/usr/local/anaconda3/bin:$PATH' ~/.zshrc; then
  echo "export PATH=/usr/local/anaconda3/bin:\$PATH" >> ~/.zshrc
fi

echo "🐍 Install conda packages"
conda --version
conda install -y pyhive
conda install -y unidecode