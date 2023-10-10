return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      ["<leader>t"] = { name = "+nvterm" },
      ["<leader>p"] = { name = "+prettier" },
      ["<leader>n"] = { name = "+neorg" },
    },
  },
}
