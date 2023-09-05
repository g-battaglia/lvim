-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "HiPhish/nvim-ts-rainbow2",
      },
    },

    opts = {

      -- nvim-ts-rainbow2 configuration
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = {},
        -- Which query to use for finding delimiters
        query = "rainbow-parens",
      },

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
        "scss",
        "jsonc",
        "vue"
      },
    },
  },
}
