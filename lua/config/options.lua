-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- :set spelllang+=it
vim.o.spelllang = "en_us,it"
vim.o.spell = true

-- To debug ad the start of vim:
-- print("opts", vim.inspect(opts.sections.lualine_x))

-- CMD Line height 0:
-- vim.opt.cmdheight = 0

-- Disable relative line number:
vim.opt.relativenumber = false

-- Disable Autoformat:
vim.g.autoformat = false

vim.g.nvim_tree_respect_buf_cwd = 1

-- Shoq empty chars:
vim.opt.list = true
vim.opt.listchars = { space = "⋅", tab = "→ " }
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append "eol:↴"

-- Set root directory
vim.g.root_spec = { "lsp", { "package.json", ".git", "lua" }, "cwd" }

-- Fold
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldmethod = 'expr'

-- Disable conceal
vim.opt.conceallevel = 0
