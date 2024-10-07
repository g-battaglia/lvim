if vim.fn.getenv("WEZTERM_EXECUTABLE") ~= vim.NIL then
  return {
    {
      "folke/tokyonight.nvim",
      opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      },
    },
  }
else
  return {}
end

