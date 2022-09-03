--             _                     _                           _
--    ___ ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___  | |_   _  __ _
--   / __/ _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \ | | | | |/ _` |
--  | (_| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/_| | |_| | (_| |
--   \___\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___(_)_|\__,_|\__,_|

if vim.fn.isdirectory(vim.fn.expand('$HOME/.config/nvim/plugged/nvim-tundra')) == 1 and vim.fn.has('nvim-0.7.0') == 1 then
  require('nvim-tundra').setup({
    transparent_background = false,
    editor = {
      search = {},
      substitute = {},
    },
    syntax = {
      booleans = { bold = true, italic = true },
      comments = { bold = true, italic = true },
      conditionals = {},
      constants = { bold = true },
      functions = {},
      keywords = {},
      loops = {},
      numbers = { bold = true },
      operators = { bold = true },
      punctuation = {},
      strings = {},
      types = { italic = true },
    },
    diagnostics = {
      errors = {},
      warnings = {},
      information = {},
      hints = {},
    },
    plugins = {
      lsp = true,
      treesitter = true,
      cmp = true,
      context = true,
      gitsigns = true,
      telescope = true,
    },
  })

  vim.opt.background = 'dark'
  vim.cmd('colorscheme tundra')
  return
end

-- Use joechrisellis/gruvbox as a backup colorscheme if Neovim is not v0.7.0 or higher.
if vim.fn.isdirectory(vim.fn.expand('$HOME/.config/nvim/plugged/gruvbox')) == 1 then
  vim.opt.background = 'dark'
  vim.cmd('colorscheme gruvbox')
  return
end
