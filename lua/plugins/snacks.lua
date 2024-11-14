return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    styles = {
      terminal = {
        height = 0.3, -- Set the terminal height as a fraction of the window
      },
      lazygit = {
        width = 0.9, -- Width of the lazygit window
        height = 0.9, -- Height of the lazygit window
      },
    },
  },
}
