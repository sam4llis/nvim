-- Autocomplete character mappings.
vim.keymap.set('i', '__', '____<esc>hi', { buffer = true })

vim.api.nvim_buf_create_user_command(
  0,
  'Run',
  function()
    vim.cmd('noautocmd write')

    vim.cmd.split()
    local winnr = vim.api.nvim_get_current_win()

    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(winnr, 12)

    vim.opt_local.winfixheight = true
    vim.opt_local.winfixwidth = true

    vim.cmd.terminal('python3 %')
  end,
  {}
)

vim.keymap.set('n', '<leader>r', ':Run<CR>', { silent = true })
