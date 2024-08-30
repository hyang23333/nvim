return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>fg",
      "<cmd> FzfLua live_grep<cr>",
      mode = "n",
      { noremap = true, desc = "Live grep current project." },
    },
    {
      "<leader>ss",
      "<cmd> FzfLua lsp_document_symbols<cr>",
      mode = "n",
      { noremap = true, desc = "Search document symbols." },
    },
    {
      "<leader>fh",
      "<cmd> FzfLua helptags<cr>",
      mode = "n",
      { noremap = true, desc = "Search help documentation." },
    },
    {
      "<leader>fc",
      "<cmd> FzfLua colorschemes<cr>",
      mode = "n",
      { noremap = true, desc = "Fuzzy search and apply colorschemes." },
    },
    {
      "<leader>fm",
      "<cmd> FzfLua builtin<cr>",
      mode = "n",
      { noremap = true, desc = "Fuzzy search builtin commands." },
    },
    {
      "<leader>fd",
      "<cmd> FzfLua commands<cr>",
      mode = "n",
      { noremap = true, desc = "Fuzzy search commands." },
    },
    {
      "<leader>sh",
      "<cmd> FzfLua search_history<cr>",
      mode = "n",
      { noremap = true, desc = "Fuzzy search search-history." },
    },
    {
      "<leader>fl",
      "<cmd> FzfLua lines<cr>",
      mode = "n",
      { noremap = true, desc = "Fzzy search lines." },
    },
    {
      "<leader>fr",
      "<cmd> FzfLua registers<cr>",
      mode = "n",
      { noremap = true, desc = "Fzzy search registers." },
    },
  },
  config = function()
    require("fzf-lua").setup({
      "fzf-vim", -- Give fzf-vim-like keymaps and feel.
      winopts = {
        width = 0.8,
        height = 0.9,
        preview = {
          hidden = "nohidden",
          vertical = "up:45%",
          horizontal = "right:50%",
          layout = "flex",
          flip_columns = 120,
          delay = 10,
          winopts = { number = false },
        },
      },
      fzf_opts = { ["--cycle"] = "" },
      files = { formatter = "path.filename_first" },
    })
  end,
}
