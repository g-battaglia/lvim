return {
  {
    "NvChad/nvterm",
    keys = {
      {
        "<leader>tt",
        "<cmd>lua require('nvterm.terminal').toggle('horizontal')<cr>",
        desc = "Toggle NvTerm"
      },
    },
    config = function()
      require("nvterm").setup()
    end,
  }
}
