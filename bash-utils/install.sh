 #!/usr/bin/env bash
set -euo pipefail

gcp --backup=numbered ./bash-utils/.tmux.conf ~/

brew install "ffmpeg"
brew install "gifsicle"

mkdir -p ~/bash_functions
gcp --backup=numbered ./bash-utils/mov2gif ~/bash_functions/
chmod +x ~/bash_functions/mov2gif

BASH_FUNC_PATH="export PATH=\$PATH:\$HOME/bash_functions/"
if ! grep -qF "$BASH_FUNC_PATH" ~/.zshrc; then
  echo $BASH_FUNC_PATH >> ~/.zshrc
fi