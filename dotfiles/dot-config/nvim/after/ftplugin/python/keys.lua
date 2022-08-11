-- Autocomplete character mappings.
vim.keymap.set('i', '__', '____<esc>hi', { buffer = true })

-- Alternate boolean {True | False} and string {f'' | ''} nodes.
vim.api.nvim_buf_create_user_command(
  0,
  'CAlternate',
  function()
    require('after.ftplugin.python.alternate').toggle()
  end,
  {}
)
