return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  config = true,
  event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    {
      "<leader>ce",
      "<cmd>:VenvSelect<cr>",
      "Change Python virtual environment",
      -- key mapping for directly retrieve from cache. You may set autocmd if you prefer the no hand approach
      --"<leader>ce", "<cmd>:VenvSelectCached<cr>"
    },
  },
}
