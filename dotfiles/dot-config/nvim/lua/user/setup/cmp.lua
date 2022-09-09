if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln('The plugin `nvim-cmp` requires Neovim 0.7.0.')
  return
end

local cmp = require('cmp')
if not cmp then return end

cmp.setup({
  completion = {
    autocomplete = {
      require('cmp.types').cmp.TriggerEvent.TextChanged,
    },
    completeopt = 'menu,menuone,noselect',
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
  },
  enabled = function()
    local context = require('cmp.config.context')
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
    end
  end,
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
  window = {
    documentation = {
      border = 'rounded',
    },
  },
})

local augroup = vim.api.nvim_create_augroup('DadbodCompletion', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
  end,
  group = augroup,
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['jedi_language_server'].setup({
  capabilities = capabilities,
})
