local installed, spellsitter = pcall(require, 'spellsitter')

-- If spellsitter.nvim is not installed, then quit prematurely.
if not installed then
  vim.api.nvim_err_writeln('The plugin `spellsitter.nvim` is not installed.')
  return
end

spellsitter.setup()
