return {
  {
    {
      "nvim-neorg/neorg",
      build = ":Neorg sync-parsers",
      opts = {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ['core.export'] = {} -- Exports Neorg documents
        },
      },
      dependencies = { { "nvim-lua/plenary.nvim" } },
      keys = {
        { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Open Neorg Index" },
      },
    },
  },
}
