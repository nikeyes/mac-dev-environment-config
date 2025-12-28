#!/usr/bin/env bash
set -euo pipefail

# Making sure that conda environment is not activated
#if [[ $CONDA_DEFAULT_ENV = "" ]] then #No he conseguido que funcione el if....
conda deactivate || true
#fi

# Configure pyenv
brew install "pyenv"
eval "$(pyenv init --path)"
if ! grep -qF 'eval "$(pyenv init --path)"' ~/.zshrc; then
  echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
fi

if ! grep -qF 'eval "$(pyenv init -)"' ~/.zshrc; then
  echo 'if command -v pyenv 1>/dev/null 2>&1; then'  >> ~/.zshrc
  echo '  eval "$(pyenv init -)"' >> ~/.zshrc
  echo 'fi' >> ~/.zshrc
fi

if ! grep -qF 'export PATH=$HOME/.pyenv/shims/python:$PATH' ~/.zshrc; then
  echo 'export PATH=$HOME/.pyenv/shims/python:$PATH' >> ~/.zshrc
fi
if ! grep -qF 'export PATH=$HOME/.pyenv/shims/:$PATH' ~/.zshrc; then
  echo 'export PATH=$HOME/.pyenv/shims/:$PATH' >> ~/.zshrc
fi

#avoid error No module named 'keyring.backends.macOS'
mkdir -p ~/.config/python_keyring/
gcp --backup=numbered ./python/keyringrc.cfg ~/.config/python_keyring/keyringrc.cfg

#if ! grep -qF 'export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring' ~/.zshrc; then
#  echo "# for avoid error with Poetry run: No module named 'keyring.backends.macOS'"
#  echo "export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring" >> ~/.zshrc
#fi

brew install jupyterlab
# pyenv install --skip-existing 3.7.13
pyenv install --skip-existing 3.8.13
pyenv install --skip-existing 3.9.11
pyenv install --skip-existing 3.10.15
pyenv install --skip-existing 3.11.10
pyenv install --skip-existing 3.12.7
pyenv install --skip-existing 3.13.0


pyenv global 3.8.13

# pip install markupsafe==2.0.1

pip install copier

echo "🧑‍🎤 Installing Poetry"
curl -sSL https://install.python-poetry.org | python3 -

export PATH="$HOME/.poetry/bin:$PATH"
if ! grep -qF 'export PATH="$HOME/.local/bin:$PATH"' ~/.zshrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

$HOME/.local/bin/poetry --version



#########
# brew install openblas
# For compilers to find openblas you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
# 
# For pkg-config to find openblas you may need to set:
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig"
# 
# export OPENBLAS=$(/opt/homebrew/bin/brew --prefix openblas)
# export CFLAGS="-falign-functions=8 ${CFLAGS}"
