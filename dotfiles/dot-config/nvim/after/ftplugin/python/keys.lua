-- Autocomplete character mappings.
vim.keymap.set('i', '__', '____<esc>hi', { buffer = true })

vim.api.nvim_buf_create_user_command(
  0,
  'Run',
  function()
    vim.cmd('noautocmd write')
    vim.cmd [[20split +terminal\ python3\ %]]
    -- vim.cmd('startinsert')
  end,
  {}
)

vim.keymap.set('n', '<leader>r', ':Run<CR>', { silent = true })
