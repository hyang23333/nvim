-------- README --------
-- colorscheme.lua : theme
-- keymaps.lua     : keymappings

-- lsp.lua         : LSP support
-- options.lua     : global options
-- plugins.lua     : third-party plugins
--____________________

--- Map Leader ---
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Requires
require("options")
require("keymaps")

vim.cmd([[autocmd InsertLeave * silent write]])
-- Plugins
require("lazy_manager")

require("manage_colorscheme") -- Manage colorschemes.
require("sn_options") -- SN options
