if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `null-ls` requires Neovim 0.7.0.")
  return
end

local sources = { null_ls.builtins.formatting.black }

null_ls.setup({ sources = sources })
