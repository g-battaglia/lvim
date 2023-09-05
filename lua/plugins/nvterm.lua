return {
  {
    "NvChad/nvterm",
    keys = {
      {
        "<leader>tt",
        "<cmd>lua require('nvterm.terminal').toggle('horizontal')<cr>",
        desc = "Toggle NvTerm"
      },
      {
        "<leader>td",
        "<cmd>lua require('nvterm.terminal').send('exit; ')<cr>",
        desc= "Kill NvTerm",
      },
      {
        "<leader>tn",
        "<cmd>lua require('nvterm.terminal').send('npm run dev')<cr>",
        desc = "Run npm run dev in NvTerm"
      },
      {
        "<leader>tc",
        "<cmd>lua require('nvterm.terminal').send('composer start')<cr>",
        desc = "Run composer start in NvTerm"
      }
    },
    config = function()
      require("nvterm").setup()
    end,
  }
}
