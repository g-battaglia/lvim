-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- FIXME --
--- Intelephense
require("lspconfig").intelephense.setup({
  settings = {
    intelephense = {
      format = {
        braces = "k&r",
      },
    },
  },
})

-- pylsp
require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        flake8 = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
        isort = { enabled = false },
        autopep8 = { enabled = false },
        pyright = { enabled = true },
        mccabe = { enabled = false },
        -- Enabled
        pylsp_mypy = { enabled = true },
        black = { enabled = true },
      },
    },
  },
})

-- Copilot Lualine
require("lualine").setup {
  sections = {
    lualine_x = {
      {
        "copilot",
        -- default is true.
        show_running = true,
        symbols = {
          -- default is " "
          running = "🚀",
        }
      },
    }
  }
}
