#!/usr/bin/env bash
set -euo pipefail

function usage {
    echo "usage: $0 [option_to_install]"
    echo " "
    echo "  --help  | -h  show usage"
    echo " "
    echo "  all           install all generic development tools"
    echo " "
    echo " ------------------ Individual Components -------------"
    echo "  brew-personal install personal selection of basic software"
    echo "  bash-utils    configure bash/tmux utilities"
    echo "  git           configure git with optional GitHub Enterprise setup"
    echo "  zsh           configure zsh with fzf and tldr"
    echo "  macos         configure macOS settings for productivity"
    echo "  ohmyzsh       install Oh my ZSH! framework and powerlevel10k theme"
    echo "  python        configure python environment with pyenv and Poetry"
    echo "  python-conda  configure anaconda with basic packages"
    echo "  pycharm       install PyCharm"
    echo "  karabiner     configure karabiner-elements for keyboard mappings"
    echo "  jdk           configure sdk-man and jdk/sdk"
    echo "  vscode        install and configure Visual Studio Code"
    echo "  dbeaver       install DBeaver database tool"
    echo "  datagrip      install JetBrains DataGrip"
    echo "  k8s-secrets   install kubeseal for Kubernetes secrets management"
    exit 1
}

echo "--------------------------------------------------------------"
echo "💻 Welcome to the macOS Dev Environment Installer 🥳"
echo "--------------------------------------------------------------"
echo " "

export PATH=/usr/local/bin:$PATH

OPTIONS=${1:-""}

case $OPTIONS in
    -h|--help)
      usage
      exit 1
      ;;
    "all"|"brew-personal"|"bash-utils"|"git"|"zsh"|"macos"|"ohmyzsh"|"python"|"python-conda"|"pycharm"|"karabiner"|"jdk"|"vscode"|"dbeaver"|"datagrip"|"k8s-secrets")
      ;;
    *)
      usage
      exit 1
      ;;
esac

echo "💂 Create backup of your .zshrc and .zshenv"
now=$(date +"%Y%m%d_%H%M%S")
[[ -e ~/.zshrc ]] && cp ~/.zshrc ~/.zshrc_"$now"
[[ -e ~/.zshenv ]] && cp ~/.zshenv ~/.zshenv_"$now"

if ! [ -d /Library/Developer/CommandLineTools ]; then
  echo "🙏 Please, click on Install & Agree to accept the Command Line Developer Tools License Agreement"
  sleep 1
  xcode-select --install
  read -rp "👀 Press enter once the installation finishes" not_needed_param
else
  echo "✅ Command Line Developer Tools are already installed!"
fi

echo "⚡️ Installing brew if not installed"
if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "brew-personal" ]]; then
  echo "📦 Installing personal brew apps"
  brew bundle --file="Brewfile-personal" || true
  echo "😅 Installing brew apps again because it might fail the first time because of dependencies."
  brew bundle --file="Brewfile-personal"
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "bash-utils" ]]; then
  echo
  echo "🥷 Configure bash utilities"
  source ./bash-utils/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "git" ]]; then
  echo
  echo "🔧 Configure git"
  source ./git/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "zsh" ]]; then
  echo
  echo "📺 Configure zsh"
  source ./zsh/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "macos" ]]; then
  echo
  echo "🔀 Setting macOS settings"
  source ./mac-os/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "ohmyzsh" ]]; then
  echo
  echo "📺 Install Oh my ZSH!"
  source ./oh-my-zsh/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "python" ]]; then
  echo
  echo "🐍 Install python environments"
  source ./python/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "python-conda" ]]; then
  echo
  echo "🐍 Install python anaconda basic packages"
  source ./python-conda/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "pycharm" ]]; then
  echo
  echo "💻 Configure PyCharm"
  source ./pycharm/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "karabiner" ]]; then
  echo
  echo "💻 Configure karabiner-elements"
  source ./karabiner/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "jdk" ]]; then
  echo
  echo "☕ Install and configure sdk-man and java jdk/sdk"
  source ./jdk/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "vscode" ]]; then
  echo
  echo "👩‍💻 Install vscode"
  source ./vscode/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "dbeaver" ]]; then
  echo
  echo "🗄️ Install DBeaver"
  source ./dbeaver/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "datagrip" ]]; then
  echo
  echo "🗄️ Install JetBrains DataGrip"
  source ./datagrip/install.sh
fi

if [[ "$OPTIONS" == "all" || "$OPTIONS" == "k8s-secrets" ]]; then
  echo
  echo "🔐 Install kubeseal for Kubernetes secrets"
  source ./k8s-secrets/install.sh
fi

echo
echo "-----------------------------------------------------------------------"
echo "🌈 Congratulation!! Your macOS dev environment is ready"
echo "🥳 Close this window and open new terminal to apply all changes"
echo "-----------------------------------------------------------------------"
