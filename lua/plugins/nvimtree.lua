return {
    -- Nvim Tree (file explorer)
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- Icons.
    },
    keys = {
        { '<leader>nt', ':NvimTreeToggle<CR>', mode = 'n', { noremap = true, silent = true }},
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup()
    end,

}
