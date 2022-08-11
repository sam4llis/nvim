local opts = {
  ['/'] = {
    ['*.go'] = {
      alternate = '{}_test.go'
    },
    ['*_test.go'] = {
      alternate = '{}.go'
    },
  },
}

vim.g.projectionist_heuristics = opts
