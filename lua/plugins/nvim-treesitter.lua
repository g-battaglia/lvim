-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      rainbow = { enable = true, extended_mode = false, max_file_lines = nil },
      ensure_installed = {
        "bash",
        "vimdoc",
        "html",
        "javascript",
        "json",
        "lua",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "svelte",
        "jsdoc",
        "yaml",
        "php",
        "phpdoc",
        "css",
      },
    },
  },
}
