-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP Servers
require("config.servers")

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
