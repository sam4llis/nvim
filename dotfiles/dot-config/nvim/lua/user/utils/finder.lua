if vim.version().minor < 7 then
  vim.notify_once('[finder.lua] Neovim 0.7 or higher is required.', vim.log.levels.WARNING)
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
