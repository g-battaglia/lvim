-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP Servers
require("config.servers")

-- Light/Dark Mode Toggle
local function toggle_light_mode()
  if vim.o.background == "light" then
    vim.o.background = "dark"
    vim.cmd.colorscheme("tokyonight-moon")
  else
    vim.o.background = "light"
    vim.cmd.colorscheme("everforest")
  end
end

vim.api.nvim_create_user_command("ToggleLightMode", toggle_light_mode, {})
vim.keymap.set("n", "<leader>tl", toggle_light_mode, { desc = "Toggle Light Mode" })

-- Gitsigns Toggle Line Highlight
vim.keymap.set("n", "<leader>tg", function()
  local gitsigns = require("gitsigns")
  gitsigns.toggle_linehl()
end, { desc = "Toggle gitsigns line highlight" })

