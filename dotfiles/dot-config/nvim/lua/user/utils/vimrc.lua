if vim.fn.has('nvim-0.7.0') ~= 1 then
  return
end

vim.api.nvim_create_user_command(
  'Vimrc',
  function()
    vim.cmd.edit('$MYVIMRC')
    vim.cmd.lcd(vim.fn.expand('%:.:h'))
  end,
  {}
)
