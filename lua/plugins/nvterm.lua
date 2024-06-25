return {
  {
    "NvChad/nvterm",
    keys = {
      {
        "<leader>tt",
        "<cmd>lua require('nvterm.terminal').toggle('horizontal')<cr>",
        desc = "Toggle NvTerm",
      },
    },

    -- | This:
    -- config = function()
    --   require("nvterm").setup()
    -- end,
    -- | is equivalent to this:
    opts = {},
  },
}
