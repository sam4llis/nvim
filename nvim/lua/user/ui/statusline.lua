local M = {}

M.gitsigns = function(kind)
  local git = vim.b.gitsigns_status_dict
  local icon = { added = '+', changed = '~', removed = '-' }

  if not git then
    return ''
  end

  if git[kind] == 0 then
    return ''
  end

  return ' ' .. icon[kind] .. (git[kind] or 0)
end

M.diagnostic = function(severity)
  local icon = { ERROR = '', HINT = '', INFO = '', WARN = '' }
  local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity] })

  if count == 0 then
    return ''
  end

  return icon[severity] .. ' ' .. count .. ' '
end

-- Git branch.
if vim.fn.isdirectory(vim.fn.expand(vim.fn.stdpath('data') .. '/plugged/vim-fugitive')) == 1 then
  vim.opt.statusline:append [[  (%{FugitiveHead()})]]
end

-- Modified.
vim.opt.statusline:append [[ %h%m%r]]

-- Filename.
vim.opt.statusline:append [[%< %f ]]

if not (vim.version().minor < 7) then
  vim.opt.statusline:append [[%#DiagnosticHint#%{v:lua.require('user.ui.statusline').gitsigns('added')}]]
  vim.opt.statusline:append [[%#DiagnosticWarn#%{v:lua.require('user.ui.statusline').gitsigns('changed')}]]
  vim.opt.statusline:append [[%#DiagnosticError#%{v:lua.require('user.ui.statusline').gitsigns('removed')}]]
end

-- Reset highlight.
vim.opt.statusline:append [[%*]]

-- Diagnostics.
if not (vim.version().minor < 7) then
  vim.opt.statusline:append [[  ]]
  vim.opt.statusline:append [[%#DiagnosticError#%{v:lua.require('user.ui.statusline').diagnostic('ERROR')}]]
  vim.opt.statusline:append [[%#DiagnosticWarn#%{v:lua.require('user.ui.statusline').diagnostic('WARN')}]]
  vim.opt.statusline:append [[%#DiagnosticInfo#%{v:lua.require('user.ui.statusline').diagnostic('INFO')}]]
  vim.opt.statusline:append [[%#DiagnosticHint#%{v:lua.require('user.ui.statusline').diagnostic('HINT')}]]
end

-- RHS components.
vim.opt.statusline:append [[%=]]

-- Reset highlight.
vim.opt.statusline:append [[%*]]

-- Cursor position and line percentage.
vim.opt.statusline:append [[%-12.(%l,%c%V%) %P]]

return M
