if vim.fn.has('nvim-0.7.0') ~= 1 then
  return
end

vim.api.nvim_create_user_command(
  'TrimWhitespace',
  function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
  {}
)
