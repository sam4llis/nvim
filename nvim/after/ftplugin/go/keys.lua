local M = {}

M.Run = function(filename)
  vim.cmd('noautocmd write')

  vim.cmd.split()
  local winnr = vim.api.nvim_get_current_win()

  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(winnr, 12)

  vim.opt_local.winfixheight = true
  vim.opt_local.winfixwidth = true

  vim.cmd.terminal('go run ' .. filename)
end

vim.keymap.set('n', '<leader>%', function() M.Run('%') end, { silent = true, buffer = 0 })
vim.keymap.set('n', '<leader>r', function() M.Run('main.go') end, { silent = true, buffer = 0 })

return M
