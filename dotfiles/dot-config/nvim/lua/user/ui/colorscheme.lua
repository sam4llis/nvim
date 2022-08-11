--             _                     _                           _
--    ___ ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___  | |_   _  __ _
--   / __/ _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \ | | | | |/ _` |
--  | (_| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/_| | |_| | (_| |
--   \___\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___(_)_|\__,_|\__,_|

if vim.fn.isdirectory(vim.fn.expand('$HOME/.config/nvim/plugged/nvim-tundra')) == 1 and vim.fn.has('nvim-0.7.0') == 1 then
  vim.opt.background = 'dark'
  require('nvim-tundra').setup()
  return
end

-- Use joechrisellis/gruvbox as a backup colorscheme if Neovim is not v0.7.0 or higher.
if vim.fn.isdirectory(vim.fn.expand('$HOME/.config/nvim/plugged/gruvbox')) == 1 then
  vim.opt.background = 'dark'
  vim.cmd('colorscheme gruvbox')
  return
end
