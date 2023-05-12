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

-- To NightOwlify:
-- require("tokyonight").setup({
--   -- use the night style
--   style = "moon",
--   -- disable italic for functions
--   styles = {
--     functions = {}
--   },
--   sidebars = { "qf", "vista_kind", "terminal", "packer" },
--   on_colors = function(colors)
--     colors.bg = "#011627"
--     colors.bg_dark = "#011627"
--     colors.bg_sidebar = "#011627" -- Term And NvimTree And WhichKey
--     colors.bg_float = "#011627" -- Floating windows like Lazy, telescope, etc
--     colors.bg_statusline = "#011627" -- Lualine
--     colors.bg_popup = "#011627"
--
--     vim.cmd("colorscheme tokyonight")
--     vim.cmd("hi BufferLineFill guibg='#011627'")
--   end
-- })


require("tokyonight").setup({
  -- use the night style
  style = "storm",
  vim.cmd("hi BufferLineFill guibg='#1e2030'")
})
