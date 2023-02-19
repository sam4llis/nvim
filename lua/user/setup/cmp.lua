if vim.version().minor < 7 then
  vim.notify_once('[cmp.lua] Neovim 0.7 or higher is required.', vim.log.levels.WARNING)
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

local servers = { 'pylsp', 'lua_ls' }

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, server in ipairs(servers) do
  require('lspconfig')[server].setup({
    capabilities = capabilities,
  })
end
