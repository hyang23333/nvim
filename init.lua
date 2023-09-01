-------- README --------
-- colorscheme.lua : theme
-- keymaps.lua     : keymappings
-- lsp.lua         : LSP support
-- options.lua     : global options
-- plugins.lua     : third-party plugins
--____________________

require('options')
require('keymaps')
require('plugins')
require('colorscheme')

-- Plugin Settings
require('plugin_options/coc')
require('plugin_options/comment')
require('plugin_options/treesitter')
require('plugin_options/indent_blankline')
require('plugin_options/telescope')

-- Filetype Settings
require('ftplugin/typescript')
