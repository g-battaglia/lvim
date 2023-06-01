return {
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
      -- show_end_of_line = true,
      space_char_blankline = " ",
    },
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      -- vim.opt.listchars:append "eol:↴"
    end,
  },
}
