-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Move line up and down wiht opt + shift + arrow up/down
map("n", "<M-Down>", "<cmd>m .+1<CR>==", { silent = true, desc = "Move line down" })
map("n", "<M-Up>", "<cmd>m .-2<CR>==", { silent = true, desc = "Move line up" })
map("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { silent = true, desc = "Move line down" })
map("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { silent = true, desc = "Move line up" })
map("v", "<M-Down>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Move line down" })
map("v", "<M-Up>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Move line up" })

-- Paste from clipboard without copying the old register
map("x", "p", [["_dP]], { silent = true, desc = "Paste from clipboard without copying the old register" })

-- "d" deletes the text and copies it to the black hole register
map("n", "d", '"_d', { silent = true, desc = "Delete text and copy to black hole register" })
map("v", "d", '"_d', { silent = true, desc = "Delete text and copy to black hole register" })
map("n", "dd", '"_dd', { silent = true, desc = "Delete line and copy to black hole register" })

-- Cut from clipboard without copying the old register
map("x", "<leader>x", [["_d]], { silent = true, desc = "Cut from clipboard without copying the old register" })
map("x", "<leader>d", [["_d]], { silent = true, desc = "Cut from clipboard without copying the old register" })

-- Toggle relative line numbers
map("n", "<leader>uL", "<cmd>set rnu!<CR>", { silent = true, desc = "Toggle relative line numbers" })

-- Save file
map({ "n", "x" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Tabs
map("n", "<leader><tab>h", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>l", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Open config files
map("n", "<leader>xc", "<cmd>edit $MYVIMRC<cr>", { desc = "Open config file" })

-- Copilot.vim mappings
map("i", "<C-]>", "<Plug>(copilot-next)", { silent = true, desc = "Copilot next" })
map("i", "<C-[>", "<Plug>(copilot-prev)", { silent = true, desc = "Copilot prev" })
map("i", "<C-}>", "<Plug>(copilot-complete)", { silent = true, desc = "Copilot complete" })
map("i", "<C-{>", "<Plug>(copilot-dismiss)", { silent = true, desc = "Copilot dismiss" })

-- Prettier
map({ "n", "v" }, "<leader>pp", "<cmd>Prettier<cr>", { silent = true, desc = "Prettier" })
map({ "n", "v" }, "<leader>pr", "<cmd>PrettierPartial<cr>", { silent = true, desc = "Prettier Partial" })
map({ "n", "v" }, "<leader>ps", "<cmd>PrettierFragment<cr>", { silent = true, desc = "Prettier Fragment" })

-- Change directory to current file
map("n", "<leader>td", "<cmd>cd %:p:h<cr>:pwd<cr>", { desc = "Change directory to current file" })

-- Git Signs
map("n", "<leader>gn", "<cmd>lua require('gitsigns').next_hunk()<cr>", { silent = true, desc = "Next Git Hunk" })
map("n", "<leader>gp", "<cmd>lua require('gitsigns').prev_hunk()<cr>", { silent = true, desc = "Previous Git Hunk" })

-- floating terminal
map("n", "<leader>tT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>tt", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
