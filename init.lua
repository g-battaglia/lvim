-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP Servers
require("config.servers")

-- Keymaps per il terminale Python
-- In visual mode, premi <leader>r per mandare il codice a Python nel terminale
vim.keymap.set("v", "<leader>r", function()
  -- copia la selezione visiva nel registro "+"
  vim.cmd('normal! "+y')

  -- se non esiste un terminale aperto, aprilo con python3
  local bufnr = vim.fn.bufnr('term://*python3')
  if bufnr == -1 then
    vim.cmd("botright split | terminal python3")
    vim.cmd("resize 15") -- altezza del terminale
  else
    vim.cmd("buffer " .. bufnr)
  end

  -- incolla e manda invio nel terminale
  vim.cmd('startinsert')
  vim.api.nvim_feedkeys(vim.fn.getreg('+') .. "\n", 't', false)
end, { desc = "Esegui selezione in REPL Python" })

-- Fai funzionare ESC nel terminale (torna a normal mode)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "ESC per uscire dal terminale" })

-- Keymap per chiudere definitivamente il terminale aperto
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.keymap.set("n", "<leader>tt", "<cmd>bd!<CR>", { buffer = true, desc = "Chiudi terminale" })
    vim.keymap.set("n", "q", "<cmd>bd!<CR>", { buffer = true, desc = "Chiudi terminale" })
  end,
})

