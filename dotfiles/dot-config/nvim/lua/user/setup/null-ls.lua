if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `null-ls` requires Neovim 0.7.0.")
  return
end

local null_ls = require('null-ls')
local helpers = require('null-ls.helpers')

local sources = {
  null_ls.builtins.formatting.blue,
}

null_ls.setup({ sources = sources })
