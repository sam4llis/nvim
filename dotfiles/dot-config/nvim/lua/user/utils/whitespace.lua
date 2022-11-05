if vim.version().minor < 7 then
  vim.notify_once('[whitespace.lua] Neovim 0.7 or higher is required.', vim.log.levels.WARNING)
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
