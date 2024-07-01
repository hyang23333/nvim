local function filename_first(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})
--- Telescope (fuzzy finder) ---
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n", { noremap = true } }, -- Find files.
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n", { noremap = true } }, -- Grep amongst files.
    { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n", { noremap = true } }, -- Find files in buffer list.
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", mode = "n", { noremap = true } }, -- Shortcut to browsing colorschemes.
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = { -- Default configuration for telescope.
        -- path_display = {
        --   filename_first = {
        --     reverse_directories = false,
        --   },
        --   shorten = {
        --     len = 5,
        --     exclude = { 1, -1 }, -- Truncate to show 5 letters, except first and first to last.
        --   },
        -- },
        path_display = filename_first, -- This is going to be native soon in the Release, using a custom func for now to do this.
        wrap_results = true, -- Enable wrap around.
        mappings = {
          i = {
            ["<C-u>"] = false, -- Allow Ctrl-U to clear in insert mode.
          },
        },
        file_ignore_patterns = {
          "package%-lock.json",
          "package.json",
          "yarn.lock",
        },
      },
      pickers = { -- Default configuration for builtin pickers.
        colorscheme = {
          enable_preview = true,
        },
      },
    })
  end,
}
