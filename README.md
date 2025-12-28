# nvim-config

Personal **Neovim** configuration, based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), designed to be portable across Unix-like systems and Windows.

## Requirements

- Neovim >= 0.10
- Git

Additional dependencies are managed automatically by the plugin ecosystem when required.

## Installation

> **Note**: Backup your existing Neovim configuration if you have one.

### Linux / macOS

```bash
git clone https://github.com/FdHerrera/nvim-config.git $HOME/.config/nvim
```

### Windows
```powershell
git clone https://github.com/FdHerrera/nvim-config.git $env:USERPROFILE\AppData\Local\nvim
```

## Usage
Start neovim
```bash
nvim
```
On first run, the **Lazy** plugin manager will automatically install all configured plugins.
Once finished, you’re ready to use Neovim normally.
