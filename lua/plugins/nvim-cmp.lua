return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    -- Immediatly event on start
    event = "InsertEnter",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- The behavior fixes indentation errors.
        ["<CR>"] = cmp.mapping.confirm({
          -- behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      })
      opts.experimental = { ghost_text = false }
    end,
  }
}
