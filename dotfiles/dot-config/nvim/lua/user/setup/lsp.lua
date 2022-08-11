if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `nvim-lspconfig` requires Neovim 0.7.0.")
  return
end

local lspconfig = require('lspconfig')

base_custom_lsp_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')

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

  if client.server_capabilities.documentHighlightProvider then
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
  end

  if client.server_capabilities.codeLensProvider then
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

  if client.server_capabilities.documentFormattingProvider then
    local augroup_id = vim.api.nvim_create_augroup('DocumentFormattingGroup', { clear = false })
    vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = bufnr })

    vim.api.nvim_create_autocmd(
      { 'BufWritePre' },
      {
        group = augroup_id,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_sync(nil, 1000)
        end,
      }
    )
  end
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Delay update agnostics.
    update_in_insert = false,
  }
)

base_server_settings = {
  on_attach = base_custom_lsp_attach,
  flags = {
    -- TODO: Remove later, this will be the default in Neovim 0.7+.
    debounce_text_changes = 150,
  }
}

local angularls_path = '/usr/local/lib/node_modules/@angular/language-server'
local angularls_cmd = { 'ngserver', '--stdio', '--tsProbeLocations', angularls_path, '--ngProbeLocations', angularls_path }

local servers = {
  angularls = {
    filetypes = { 'html', 'typescript' },
    cmd = angularls_cmd,
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = angularls_cmd
    end,
  },

  pyright = {
    filetypes = { 'python' },
  },

  tailwindcss = {
    filetypes = { 'html' },
  },

  tsserver = {
    filetypes = { 'javascript', 'typescript' },
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
  },

  gopls = {
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  },
}

for server, additional_server_settings in pairs(servers) do
  local server_settings = vim.tbl_extend('force', base_server_settings, additional_server_settings)
  lspconfig[server].setup(server_settings)
end
