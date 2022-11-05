-- Git branch.
if vim.fn.isdirectory(vim.fn.expand(vim.fn.stdpath('data') .. '/plugged/vim-fugitive')) == 1 then
  vim.opt.statusline:append [[%{FugitiveStatusline()} ]]
end

-- Filename and modified.
vim.opt.statusline:append [[%< %f %h%m%r ]]

-- RHS components.
vim.opt.statusline:append [[%=]]

-- Added/Removed/Changed.
if not (vim.version().minor < 7) then
  vim.opt.statusline:append [[%-12.{get(b:,'gitsigns_status','')} ]]
end

-- Cursor position and line percentage.
vim.opt.statusline:append [[%-12.(%l,%c%V%) %P]]
