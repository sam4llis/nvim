if vim.fn.has('nvim-0.6.1') ~= 1 then
  vim.api.nvim_err_writeln('The plugin `nvim-dap` requires Neovim 0.6.1.')
  return
end

require('user.setup.dap.keys')
require('user.setup.dap.dapui')
