#!/usr/bin/env bash
set -euo pipefail

brew install --cask visual-studio-code

sudo xattr -d com.apple.quarantine /Applications/Visual\ Studio\ Code.app

code --install-extension MS-vsliveshare.vsliveshare
code --install-extension ms-python.python
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.makefile-tools
code --install-extension moshfeu.compare-folders
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension tamasfe.even-better-toml
code --install-extension eamodio.gitlens
code --install-extension usernamehw.errorlens
code --install-extension ms-python.flake8
code --install-extension ms-python.pylint
code --install-extension ms-python.black-formatter
code --install-extension rangav.vscode-thunder-client
code --install-extension fnando.linter
code --install-extension exiasr.hadolint

#code --install-extension oderwat.indent-rainbow

# MCP Servers
## Context7
code --add-mcp "{\"name\":\"Сontext7\",\"command\": \"docker\",\"args\": [\"run\", \"-i\", \"--rm\", \"context7-mcp\"]}"

# copy vscode settings
gcp --backup=numbered ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
gcp --backup=numbered ./vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

