# nvim-config

Personal configuration for nvim for software development

Pre-requesites:

- Nvim >= 0.7
- **npm >= 9.5.1
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

Define Environment Variable JAVA_17 pointing to jdk 17 (preferably, also JAVA_11 and JAVA_18)

Clone this repo: on windows "$user/AppData/Local/nvim"
- 'npm install -g tree-sitter'
- 'npm install -g neovim'
Install Vim Plug
Run 'Plug Install'
Run 'TSUpdate'

For Java Testing and Debugging:

Clone and install microsoft/java-debug, define an environment variable named: 'JAVA_DEBUGGER'
Clone and install microsoft/vscode-java-test, define an environment variable named: 'VSCODE_JAVA_TEST'

