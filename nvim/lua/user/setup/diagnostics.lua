if vim.version().minor < 7 then
  vim.notify_once('[diagnostics.lua] Neovim 0.7 or higher is required.', vim.log.levels.WARNING)
  return
end

vim.keymap.set('n', 'ycq', vim.diagnostic.setqflist)
vim.keymap.set(
  'n',
  'ycQ',
  function()
    vim.diagnostic.setqflist({ severity = { min = vim.diagnostic.severity.ERROR } })
  end
)

vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)

vim.keymap.set(
  'n',
  '[G',
  function()
    vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.ERROR } })
  end
)

vim.keymap.set(
  'n',
  ']G',
  function()
    vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.ERROR } })
  end
)
