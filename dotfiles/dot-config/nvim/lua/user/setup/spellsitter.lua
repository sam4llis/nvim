local installed, spellsitter = pcall(require, 'spellsitter')

-- If spellsitter.nvim is not installed, then quit prematurely.
if not installed then
  vim.api.nvim_err_writeln('The plugin `spellsitter.nvim` is not installed.')
  return
end

vim.opt.spell = true
require('spellsitter').setup()

-- -- Selectively disable spellchecking for certain file types.
-- local group = vim.api.nvim_create_augroup('spellsitter', { clear = true })
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'python', 'lua' },
--   command = 'setlocal nospell',
--   group = group,
-- })
