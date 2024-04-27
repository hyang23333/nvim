--- Telescope (fuzzy finder) ---
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n", { noremap = true } }, -- Find files.
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n", { noremap = true } }, -- Grep amongst files.
    { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n", { noremap = true } }, -- Find files in buffer list.
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n", { noremap = true } }, -- Find help tags.
    { "<leader>tc", "<cmd>Telescope colorscheme<cr>", mode = "n", { noremap = true } }, -- Shortcut to browsing colorschemes.
    {
      "<leader>ss",
      "<cmd>:Telescope lsp_document_symbols symbols={'function','method','constructor'}<cr>",
      mode = "n",
      { noremap = true },
    }, -- Search functions in current buffer.
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        help_tags = {
          mappings = {
            i = {
              ["<CR>"] = "file_vsplit", -- Do vertical split by default.
            },
          },
        },
      },
      defaults = {
        path_display = {
          shorten = {
            len = 5,
            exclude = { 1, -1 }, -- Truncate to show 5 letters, except first and first to last.
          },
        },
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
    })
  end,
}
