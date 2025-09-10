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

-- Ripristina frecce a j/k normali
map({ "n", "x" }, "<Down>", "j", { desc = "Move cursor down" })
map({ "n", "x" }, "<Up>", "k", { desc = "Move cursor up" })


-- Keymap per eseguire codice Python selezionato tramite file temporaneo
vim.keymap.set("v", "<leader>r", function()
  -- Copia la selezione nel registro di sistema
  vim.cmd('normal! "+y')
  local code = vim.fn.getreg('+')

  -- Crea file temporaneo
  local temp_file = os.tmpname() .. ".py"
  local file = io.open(temp_file, "w")
  if not file then
    vim.notify("Errore nella creazione del file temporaneo", vim.log.levels.ERROR)
    return
  end

  file:write(code)
  file:close()

  -- Trova o crea terminale Python
  local python_buf = vim.fn.bufnr('term://*python3')
  if python_buf == -1 then
    vim.cmd("botright split | terminal python3")
    vim.cmd("resize 15")
  else
    vim.cmd("buffer " .. python_buf)
  end

  -- Esegui il file e cancellalo
  vim.cmd('startinsert')
  local command = string.format("exec(open('%s').read()); import os; os.remove('%s')\n",
    temp_file, temp_file)
  vim.api.nvim_feedkeys(command, 't', false)

  -- Torna in normal mode dopo un piccolo delay
  vim.defer_fn(function()
    vim.cmd('stopinsert')
  end, 500)
end, { desc = "Esegui selezione Python tramite file temporaneo" })


-- In normal mode, premi <leader>rr per eseguire l'intero file Python
vim.keymap.set("n", "<leader>rr", function()
  local current_file = vim.fn.expand('%:p')
  local file_extension = vim.fn.expand('%:e')

  if file_extension ~= 'py' then
    vim.notify("Il file corrente non è un file Python (.py)", vim.log.levels.WARN)
    return
  end

  -- se non esiste un terminale aperto, aprilo con python3
  local bufnr = vim.fn.bufnr('term://*python3')
  if bufnr == -1 then
    vim.cmd("botright split | terminal python3")
    vim.cmd("resize 15") -- altezza del terminale
  else
    vim.cmd("buffer " .. bufnr)
  end

  -- esegui il file corrente
  vim.cmd('startinsert')
  local exec_command = string.format("exec(open('%s').read())\n", current_file)
  vim.api.nvim_feedkeys(exec_command, 't', false)
end, { desc = "Esegui file Python corrente in REPL" })

-- Fai funzionare ESC nel terminale (torna a normal mode)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "ESC per uscire dal terminale" })

-- Keymap per chiudere definitivamente il terminale aperto
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.keymap.set("n", "<leader>tt", "<cmd>bd!<CR>", { buffer = true, desc = "Chiudi terminale" })
    vim.keymap.set("n", "q", "<cmd>bd!<CR>", { buffer = true, desc = "Chiudi terminale" })
  end,
})
