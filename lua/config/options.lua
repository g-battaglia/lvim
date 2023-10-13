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
