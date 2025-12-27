-- Add plugins and dependencies needed for java development, such as a debugger and a test runner
return {
  {
    'mfussenegger/nvim-jdtls',
  },
  {
    'microsoft/java-debug',
    build = 'mvnw clean install',
  },
  {
    'microsoft/vscode-java-test',
    build = 'npm install && npm run build-plugin',
  },
}
