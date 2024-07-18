return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      ["<leader>t"] = { name = "+nvterm" },
      ["<leader>p"] = { name = "+prettier" },
    },
  },
}
