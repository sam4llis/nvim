if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `null-ls` requires Neovim 0.7.0.")
  return
end

local null_ls = require('null-ls')
local helpers = require('null-ls.helpers')

local sources = {
  null_ls.builtins.formatting.blue,
  null_ls.builtins.diagnostics.vale,
}

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)

    if client.server_capabilities.documentFormattingProvider then
      local augroup_id = vim.api.nvim_create_augroup('LspFormattingGroup', { clear = false })
      vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = bufnr })
    end

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
})
