if vim.version().minor < 8 then
  vim.notify_once('[dap/init.lua] Neovim 0.8 or higher is required.', vim.log.levels.WARNING)
  return
end

require('user.setup.dap.keys')
require('user.setup.dap.dapui')
