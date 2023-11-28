# nvim-config

Configuration setted up from kickstart. ['see'](https://github.com/nvim-lua/kickstart.nvim)

### Introduction

A starting point for Neovim that is:

* Small
* Single-file (with examples of moving to multi-file)
* Documented
* Modular

This repo is meant to be used by **YOU** to begin your Neovim journey; remove the things you don't use and add what you miss.

Kickstart.nvim targets *only* the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim. If you are experiencing issues, please make sure you have the latest versions.

Distribution Alternatives:
- [LazyVim](https://www.lazyvim.org/): A delightful distribution maintained by @folke (the author of lazy.nvim, the package manager used here)

### Installation

> **NOTE** 
> [Backup](#FAQ) your previous configuration (if any exists)

Requirements:
* Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
  * [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [telescope](https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies) pickers.
* See [Windows Installation](#Windows-Installation) if you have trouble with `telescope-fzf-native`

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%userprofile%\AppData\Local\nvim\` |
| Windows (powershell)| `$env:USERPROFILE\AppData\Local\nvim\` |

Clone kickstart.nvim:

```sh
# on Linux and Mac
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```


```
# on Windows (cmd)
git clone https://github.com/nvim-lua/kickstart.nvim.git %userprofile%\AppData\Local\nvim\ 
```

```
# on Windows (powershell)
git clone https://github.com/nvim-lua/kickstart.nvim.git $env:USERPROFILE\AppData\Local\nvim\ 
```


### Post Installation

Start Neovim

```sh
nvim
```

The `Lazy` plugin manager will start automatically on the first run and install the configured plugins - as can be seen in the introduction video. After the installation is complete you can press `q` to close the `Lazy` UI and **you are ready to go**! Next time you run nvim `Lazy` will no longer show up.

If you would prefer to hide this step and run the plugin sync from the command line, you can use:

```sh
nvim --headless "+Lazy! sync" +qa
```


This repository contains my personal configuration for Neovim, tailored for software development. It includes various plugins and settings to enhance my coding experience.

## Prerequisites

Before setting up this Neovim configuration, ensure that you have the following prerequisites installed on your system:

- Neovim >= 0.9.0
- npm >= 9.5.1
- node >= v19.8.1
- yarn
- Windows Terminal with PowerShell
- Python3
- pip
- Java 17 (Other versions defined in PATH for development)
- Visual Studio >= 17
- Wget
- curl
- tar
- pynvim
- C runner (on Windows, preferably 'gcc')
- Maven
- clang-format
- sed

## Setup

Please follow the steps below to set up the Neovim configuration:

1. Ensure that you have three Java JDK installations available: 'JAVA_17', 'JAVA_18', and 'JAVA_11'. These should be defined as environment variables pointing to the respective source folders of each JDK.

2. Clone this repository to the following location on Windows: "$user/AppData/Local/nvim".

3. Install the required global npm packages:
- `npm install -g neovim`
- `npm install -g tree-sitter`
- `winget install StrawberryPerl.StrawberryPerl`


Now your Neovim configuration should be set up and ready to use. Feel free to explore the various plugins and settings included in this configuration to enhance your coding workflow.

## Contact

If you have any questions or need further assistance, you can reach me at [federico.herrera_dev@outlook.com](mailto:federico.herrera_dev@outlook.com).
