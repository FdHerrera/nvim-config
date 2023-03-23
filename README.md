# nvim-config

Personal configuration for nvim for software development

Pre-requesites:

- Nvim >= 0.7
- npm >= 9.5.1
- node >= v19.8.1
- yarn
- Windows Terminal with Powershell
- Python3
- pip 
- Java 17 (Other versions defined in PATH for development)
- Visual Studio >= 17
- Wget
- curl
- tar
- pynvim
- C runner (on windows, preferable 'cc')
- maven

Setup:

Needs to define 3 Java JDK's in the environment variables: 'JAVA_17', 'JAVA_18', 'JAVA_11' pointing to the source folder of each JDK.

Clone this repo: on windows "$user/AppData/Local/nvim"
- Install and setup vim-plug for plugins managment.
- 'npm install -g neovim'
- 'npm install -g tree-sitter'
- Install Vim Plug
- Run 'Plug Install'
- Run 'TSUpdate'

For Java Testing and Debugging:

Clone and install microsoft/java-debug, define an environment variable named: 'JAVA_DEBUGGER'
Clone and install microsoft/vscode-java-test, define an environment variable named: 'VSCODE_JAVA_TEST'

