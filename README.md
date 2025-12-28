# macOS Development Environment Setup

Generic macOS development environment configuration scripts for developers.

## Quick Start

```bash
git clone https://github.com/nikeyes/mac-dev-environment-config.git
cd mac-dev-environment-config
./install.sh all
```

## Features

- **Homebrew**: Package manager and essential development tools
- **Oh My Zsh**: Enhanced terminal with productivity plugins
- **Python**: pyenv, Poetry, JupyterLab setup
- **IDEs**: PyCharm, VSCode, DataGrip, DBeaver configurations
- **Utilities**: tmux, karabiner, macOS settings optimization
- **Java**: sdk-man and JDK setup
- **Kubernetes**: kubeseal for secrets management

## Usage

```bash
./install.sh --help
```

### Install Everything
```bash
./install.sh all
```

### Install Individual Components
```bash
./install.sh python          # Python development environment
./install.sh vscode          # Visual Studio Code
./install.sh ohmyzsh         # Oh My Zsh terminal framework
./install.sh macos           # macOS productivity settings
# ... see --help for all options
```

## Update

```bash
./update.sh
```

## Components

| Component | Description |
|-----------|-------------|
| `bash-utils/` | tmux configuration and bash utilities |
| `git/` | Git config with GitHub Enterprise support (prompts for GHE URL) |
| `mac-os/` | macOS system preferences optimization |
| `oh-my-zsh/` | Oh My Zsh with powerlevel10k theme |
| `python/` | pyenv, Poetry, JupyterLab setup |
| `python-conda/` | Anaconda with common packages |
| `pycharm/` | PyCharm IDE installation |
| `karabiner/` | Keyboard remapping configuration |
| `jdk/` | Java JDK via sdk-man |
| `vscode/` | VSCode with extensions and MCP servers |
| `dbeaver/` | DBeaver database tool |
| `datagrip/` | JetBrains DataGrip IDE |
| `k8s-secrets/` | Kubernetes sealed secrets (kubeseal) |
| `zsh/` | zsh with fzf and tldr utilities |

## Requirements

- macOS (tested on Apple Silicon and Intel)
- Internet connection
- Administrator privileges

## Troubleshooting

### Permission Denied Error
```bash
xattr -d com.apple.quarantine ./install.sh
```

### Homebrew Installation Issues
Ensure Command Line Developer Tools are installed:
```bash
xcode-select --install
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - feel free to use and modify for your own setup.
