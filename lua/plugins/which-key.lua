return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      ["<leader>h"] = { name = "+harpoon" },
      ["<leader>t"] = { name = "+nvterm" },
      ["<leader>p"] = { name = "+prettier" },
    },
  },
}
