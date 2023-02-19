function _G.user_foldtext()
  local foldstart = vim.fn.getline(vim.v.foldstart)
  local preview = vim.fn.getline(vim.v.foldstart + 1):match('^%s*(.*)')
  return foldstart .. preview .. '"""'
end
