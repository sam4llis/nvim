--   _                    _
--  | | _____ _   _ ___  | |_   _  __ _
--  | |/ / _ \ | | / __| | | | | |/ _` |
--  |   <  __/ |_| \__ \_| | |_| | (_| |
--  |_|\_\___|\__, |___(_)_|\__,_|\__,_|
--            |___/

-- <space> is leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normalise search direction behaviour.
vim.keymap.set('n', 'n', "(v:searchforward ? 'n' : 'N')", { expr = true })
vim.keymap.set('n', 'N', "(v:searchforward ? 'N' : 'n')", { expr = true })
vim.keymap.set('o', 'n', "(v:searchforward ? 'n' : 'N')", { expr = true })
vim.keymap.set('o', 'N', "(v:searchforward ? 'N' : 'n')", { expr = true })
vim.keymap.set('x', 'n', "(v:searchforward ? 'n' : 'N')", { expr = true })
vim.keymap.set('x', 'N', "(v:searchforward ? 'N' : 'n')", { expr = true })

-- Sort lines.
vim.keymap.set('v', '<leader>s', ':sort<CR>', { silent = true })
vim.keymap.set('v', '<leader>S', ':sort!<CR>', { silent = true })

-- Align and prettify table entries and columns.
vim.keymap.set('v', '<leader>c', ':%!column -t<CR>', { silent = true })

-- Telescope mappings.
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>fr', ':Telescope resume<CR>', { silent = true })
vim.keymap.set('n', '<leader>fa', ':Telescope arglist<CR>', { silent = true })
vim.keymap.set('n', '<leader>fs', ':Telescope spell_suggest<CR>', { silent = true })
