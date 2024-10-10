return {
  -- Escape insert mode quickly with customized key combination without lag.
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
    })
  end,
}
