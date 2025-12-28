#!/usr/bin/env bash
set -euo pipefail

brew install --cask karabiner-elements

# copy vscode settings
gcp --backup=numbered ./karabiner/karabiner.json ~/.config/karabiner/karabiner.json