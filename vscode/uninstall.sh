#!/usr/bin/env bash
set -euo pipefail

brew uninstall visual-studio-code

rm -rf ~/.vscode/extensions
rm -rf "$HOME/Library/Application Support/Code"

