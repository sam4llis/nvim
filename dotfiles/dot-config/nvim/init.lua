--   _       _ _     _
--  (_)_ __ (_) |_  | |_   _  __ _
--  | | '_ \| | __| | | | | |/ _` |
--  | | | | | | |_ _| | |_| | (_| |
--  |_|_| |_|_|\__(_)_|\__,_|\__,_|

-- Load plugin dependencies, user settings, and user key mappings.
require('user.plugins')
require('user.settings')
require('user.keys')

-- Load utility functions.
require('user.utils.finder')
require('user.utils.vimrc')
require('user.utils.whitespace')
require('user.utils.autocmds')

-- Setup plugins.
require('user.setup.cmp')
require('user.setup.dap')
require('user.setup.diagnostics')
require('user.setup.gitsigns')
require('user.setup.lsp')
require('user.setup.projectionist')
require('user.setup.telescope')
require('user.setup.treesitter')

-- Load user interface.
require('user.ui.colorscheme')
