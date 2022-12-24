vim.opt_local.colorcolumn = '80,99'
vim.opt_local.spell = true

-- Override fold queries.
vim.treesitter.set_query("python", "folds", [[
  (expression_statement) @fold
]])
