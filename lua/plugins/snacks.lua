return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      priority = 1,
      enabled = true, -- enable indent guides
      char = "│",
      only_scope = false, -- only show indent guides of the scope
      only_current = false, -- only show indent guides in the current window
      hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
      -- can be a list of hl groups to cycle through
      -- hl = {
      --     "SnacksIndent1",
      --     "SnacksIndent2",
      --     "SnacksIndent3",
      --     "SnacksIndent4",
      --     "SnacksIndent5",
      --     "SnacksIndent6",
      --     "SnacksIndent7",
      --     "SnacksIndent8",
      -- },
      animate = {
        enabled = false,
      },
    },
    styles = {
      terminal = {
        height = 0.3, -- Set the terminal height as a fraction of the window
      },
      lazygit = {
        width = 0.9, -- Width of the lazygit window
        height = 0.9, -- Height of the lazygit window
      },
    },
    scroll = {
      enabled = false,
    }
  },
}
