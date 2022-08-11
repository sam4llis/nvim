if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `nvim-lspconfig (diagnostics)` requires Neovim 0.7.0.")
  return
end

vim.keymap.set('n', 'ycq', vim.diagnostic.setqflist)
vim.keymap.set(
  'n',
  'ycQ',
  function()
    vim.diagnostic.setqflist({severity={min=vim.diagnostic.severity.ERROR}})
  end
)

vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)

vim.keymap.set(
  'n',
  '[G',
  function()
    vim.diagnostic.goto_prev({severity={min=vim.diagnostic.severity.ERROR}})
  end
)

vim.keymap.set(
  'n',
  ']G',
  function()
    vim.diagnostic.goto_next({severity={min=vim.diagnostic.severity.ERROR}})
  end
)
