return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        -- use the night style
        style = "storm",
        vim.cmd("hi BufferLineFill guibg='#1e2030'"),
      })

      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
