-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP Servers
require("config.servers")

-- Keymaps per il terminale Python
-- In visual mode, premi <leader>r per mandare il codice a Python nel terminale
vim.keymap.set("v", "<leader>r", function()
  -- copia la selezione visiva nel registro "+"
  vim.cmd('normal! "+y')
  local selected_text = vim.fn.getreg('+')

  -- crea un file temporaneo
  local temp_file = os.tmpname() .. ".py"
  local file = io.open(temp_file, "w")
  if file then
    file:write(selected_text)
    file:close()
  else
    vim.notify("Errore nella creazione del file temporaneo", vim.log.levels.ERROR)
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

  -- esegui il file temporaneo e poi eliminalo
  vim.cmd('startinsert')
  local exec_command = string.format("exec(open('%s').read()); import os; os.remove('%s')\n", temp_file, temp_file)
  vim.api.nvim_feedkeys(exec_command, 't', false)
end, { desc = "Esegui selezione in REPL Python tramite file temporaneo" })

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

