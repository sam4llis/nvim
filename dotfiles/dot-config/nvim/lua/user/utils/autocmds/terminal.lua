local augroup_id = vim.api.nvim_create_augroup('NeovimTerminal', { clear = false })
vim.api.nvim_clear_autocmds({ group = augroup_id })

vim.api.nvim_create_autocmd(
  { 'TermOpen' },
  {
    group = augroup_id,
    callback = function()
      -- Remove line numbers.
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false

      -- By default, start the terminal window in `Insert` mode.
      vim.cmd('startinsert')
    end,
  }
)
