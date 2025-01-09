return {
  sonarlint_language_server = {
    default_config = {
      cmd = { "sonarlint-language-server" },
      filetypes = {
        "java",
        "yml",
        "yaml",
      },
      root_dir = function(fname)
        return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
      end,
    },
  }
}
