if vim.fn.has('nvim-0.7.0') ~= 1 then
  return
end

vim.api.nvim_create_user_command(
  'Finder',
  function()
    vim.cmd('silent !open %:p:h')
  end,
  {}
)
