-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- To debug ad the start of vim:
-- print("opts", vim.inspect(opts.sections.lualine_x))

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

require("tokyonight").setup({
  -- use the night style
  style = "storm",
  vim.cmd("hi BufferLineFill guibg='#1e2030'"),
})
