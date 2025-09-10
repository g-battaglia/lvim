return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
          ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
          ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
          ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
          ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
          ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
          ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
   ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
      },
    },
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
    },
    animate = {
      enabled = false,
    },
  },
}
