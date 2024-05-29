return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    --[[
    table.insert(opts.sections.lualine_x, 2, {
      "copilot",
      -- default is true.
      show_running = true,
    })
    --]]
  end,
}
