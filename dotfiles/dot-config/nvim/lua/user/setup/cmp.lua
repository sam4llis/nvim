if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln('The plugin `nvim-cmp` requires Neovim 0.7.0.')
  return
end

local cmp = require('cmp')
if not cmp then return end

cmp.setup({
  completion = {
    autocomplete = false,
    completeopt = 'menu,menuone,noselect',
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
  },
  formatting = {
    format = function(_, entry)
      entry.kind = (require('user.ui.icons.cmp')[entry.kind] or '') .. entry.kind
      return entry
    end,
  },
  experimental = {
    ghost_text = true,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-x><C-o>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-x><C-z>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
})
