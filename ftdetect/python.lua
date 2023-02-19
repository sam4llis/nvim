local augroup_id = vim.api.nvim_create_augroup('Templates', { clear = false })
vim.api.nvim_clear_autocmds({ group = augroup_id })

vim.api.nvim_create_autocmd(
  { 'BufNewFile' },
  {
    group = augroup_id,
    pattern = { '*.py' },
    callback = function()
      vim.cmd('silent 0r ' .. vim.fn.stdpath('config') .. '/template/skeleton.py')
    end,
  }
)
