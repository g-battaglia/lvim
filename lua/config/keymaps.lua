-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Move line up and down wiht opt + shift + arrow up/down
map("n", "<M-Down>", "<cmd>:m .+1<CR>==", { silent = true, desc = "Move line down" })
map("n", "<M-Up>", "<cmd>:m .-2<CR>==", { silent = true, desc = "Move line up" })

-- Paste from clipboard without copying the old register
map("x", "<leader>p", [["_dP]], { silent = true, desc = "Paste from clipboard without copying the old register" })

-- Cut from clipboard without copying the old register
map("x", "<leader>x", [["_d]], { silent = true, desc = "Cut from clipboard without copying the old register" })
map("x", "<leader>d", [["_d]], { silent = true, desc = "Cut from clipboard without copying the old register" })

-- Toggle relative line numbers
map("n", "<leader>uL", "<cmd>set rnu!<CR>", { silent = true, desc = "Toggle relative line numbers" })

-- Save file
map({ "n", "x" }, "<leader>fs", "<cmd>:w<CR>", { silent = true, desc = "Save file" })

-- Tabs
map("n", "<leader><tab>h", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>l", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Open config files
map("n", "<leader>xc", "<cmd>edit $MYVIMRC<cr>", { desc = "Open config file" })