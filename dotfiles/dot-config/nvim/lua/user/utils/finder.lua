if vim.fn.has('nvim-0.7.0') ~= 1 then
  return
end

vim.api.nvim_create_user_command(
  'Finder',
  function()
    local os = vim.loop.os_uname().sysname
    if os == 'Darwin' then
      vim.cmd('silent !open %:p:h')
    elseif os == 'Windows_NT' then
      vim.cmd('silent !explorer %:p:h')
    end
  end,
  {}
)
