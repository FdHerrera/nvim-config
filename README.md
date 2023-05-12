# nvim-config

This repository contains my personal configuration for Neovim, tailored for software development. It includes various plugins and settings to enhance my coding experience.

## Prerequisites

Before setting up this Neovim configuration, ensure that you have the following prerequisites installed on your system:

- Neovim >= 0.7
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
- C runner (on Windows, preferably 'cc')
- Maven
- clang-format
- sed

## Setup

Please follow the steps below to set up the Neovim configuration:

1. Ensure that you have three Java JDK installations available: 'JAVA_17', 'JAVA_18', and 'JAVA_11'. These should be defined as environment variables pointing to the respective source folders of each JDK.

2. For Java testing and debugging, clone and install the following repositories:
   - [microsoft/java-debug](https://github.com/microsoft/java-debug)
   - [microsoft/vscode-java-test](https://github.com/microsoft/vscode-java-test)

   Define the following environment variables accordingly:
   - 'JAVA_DEBUGGER': Path to the java-debug repository
   - 'VSCODE_JAVA_TEST': Path to the vscode-java-test repository

3. Clone this repository to the following location on Windows: "$user/AppData/Local/nvim".

4. Install and set up vim-plug for plugin management. You can find more information about vim-plug [here](https://github.com/junegunn/vim-plug).

5. Install the required global npm packages:
- `npm install -g neovim`
- `npm install -g tree-sitter`


6. Install the Vim plugins by running the following commands within Neovim:
- `:PlugInstall`


7. Run the following command to update the tree-sitter parser:
- `:TSUpdate`


Now your Neovim configuration should be set up and ready to use. Feel free to explore the various plugins and settings included in this configuration to enhance your coding workflow.


## License

This project is licensed under the [MIT License](LICENSE).

## Contact

If you have any questions or need further assistance, you can reach me at [federico.herrera_dev@outlook.com](mailto:federico.herrera_dev@outlook.com).

