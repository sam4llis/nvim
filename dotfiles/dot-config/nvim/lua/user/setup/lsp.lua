if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `nvim-lspconfig` requires Neovim 0.7.0.")
  return
end

local lspconfig = require('lspconfig')
local setup = {}

local has_null_ls, null_ls = pcall(require, 'null-ls')
if has_null_ls then
  lspconfig['null_ls'] = null_ls

  null_ls_config = {
    sources = {
      null_ls.builtins.formatting.blue,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.vale,
    },
  }
end

setup.keymaps = function(client, bufnr)
  local opts_with_desc = function(desc)
    return {
      noremap = true,
      silent = true,
      buffer = bufnr,
      desc = desc,
    }
  end

  vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition,      opts_with_desc('vim.lsp.buf.definition'))
  vim.keymap.set('n', 'K',     vim.lsp.buf.hover,           opts_with_desc('vim.lsp.buf.hover'))
  vim.keymap.set('n', 'yca',   vim.lsp.buf.code_action,     opts_with_desc('vim.lsp.buf.code_action'))
  vim.keymap.set('n', 'ycd',   vim.lsp.buf.definition,      opts_with_desc('vim.lsp.buf.definition'))
  vim.keymap.set('n', 'yci',   vim.lsp.buf.incoming_calls,  opts_with_desc('vim.lsp.buf.incoming_calls'))
  vim.keymap.set('n', 'ycm',   vim.lsp.buf.implementation,  opts_with_desc('vim.lsp.buf.implementation'))
  vim.keymap.set('n', 'ycn',   vim.lsp.buf.rename,          opts_with_desc('vim.lsp.buf.rename'))
  vim.keymap.set('n', 'yco',   vim.lsp.buf.outgoing_calls,  opts_with_desc('vim.lsp.buf.outgoing_calls'))
  vim.keymap.set('n', 'ycr',   vim.lsp.buf.references,      opts_with_desc('vim.lsp.buf.references'))
  vim.keymap.set('n', 'ycs',   vim.lsp.buf.signature_help,  opts_with_desc('vim.lsp.buf.signature_help'))
  vim.keymap.set('n', 'yct',   vim.lsp.buf.type_definition, opts_with_desc('vim.lsp.buf.type_definition'))
  vim.keymap.set('n', 'ycl',   vim.lsp.codelens.run,        opts_with_desc('vim.lsp.codelens.run'))
  vim.keymap.set('i', '<C-q>', vim.lsp.buf.signature_help,  opts_with_desc('vim.lsp.buf.signature_help'))
end

setup.document_highlights = function(client, bufnr)
  if not client.server_capabilities.documentHighlightProvider then
    return
  end

  local augroup_id = vim.api.nvim_create_augroup('DocumentHighlightGroup', { clear = false })
  vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = bufnr })

  vim.api.nvim_create_autocmd(
  { 'CursorHold' },
  {
    group = augroup_id,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.clear_references()
      vim.lsp.buf.document_highlight()
    end
  }
  )

  vim.api.nvim_create_autocmd(
  { 'InsertEnter' },
  {
    group = augroup_id,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.clear_references()
    end
  }
  )
end

setup.codelens = function(client, bufnr)
  if not client.server_capabilities.codeLensProvider then
    return
  end

  local augroup_id = vim.api.nvim_create_augroup('CodeLensGroup', { clear = false })
  vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = bufnr })

  vim.api.nvim_create_autocmd(
  { 'BufEnter' },
  {
    group = augroup_id,
    buffer = bufnr,
    once = true,
    callback = vim.lsp.codelens.refresh,
  }
  )
  vim.api.nvim_create_autocmd(
  { 'BufWritePost', 'CursorHold', 'InsertLeave' },
  {
    group = augroup_id,
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  }
  )
end

setup.format_on_save = function(client, bufnr)
  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  print(vim.inspect(client.server_capabilities))

  local augroup_id = vim.api.nvim_create_augroup('DocumentFormattingGroup', { clear = false })
  vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = bufnr })

  vim.api.nvim_create_autocmd(
  { 'BufWritePre' },
  {
    group = augroup_id,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format{
        bufnr = bufnr,
      }
    end,
  }
  )
end

local custom_lsp_attach = function(setup_callbacks)
  return function(client, bufnr)
    for _, setup_function in pairs(setup_callbacks) do
      setup_function(client, bufnr)
    end
  end
end

local base_server_settings = {
  -- By default, set up everything.
  on_attach = custom_lsp_attach(setup)
}

local configs = {
  --
  -- TODO: Populate servers. To populate servers with base server settings:
  --   server_name = {},
  -- Or, to populate using a custom LSP attach:
  --   server_name = {
  --     on_attach = custom_lsp_attach({
  --       setup.keymaps,
  --       setup.document_highlights,
  --       setup.codelens,
  --     })
  --   },
  -- Finally, to call null-ls servers:
  --   null_ls = null_ls_config,
  --
}

for server, server_specific_settings in pairs(configs) do
  local server_settings = vim.tbl_extend('force', base_server_settings, server_specific_settings)
  lspconfig[server].setup(server_settings)
end
