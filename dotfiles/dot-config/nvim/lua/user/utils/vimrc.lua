if vim.fn.has('nvim-0.8.0') ~= 1 then
  return
end

vim.api.nvim_create_user_command('Vimrc',
  function(opts)
    vim.cmd('lcd ' .. vim.fn.stdpath('config'))

    if opts.args == '' then
      vim.cmd('edit $MYVIMRC')
    else
      local path = vim.fs.find({ opts.args .. '.lua' }, {
        path = vim.fn.stdpath('config') .. '/lua',
      })[1]

      if not path then
        vim.api.nvim_err_writeln(string.format('[Vimrc]: File %s.lua not found.', opts.args))
        return
      end

      vim.cmd('edit ' .. path)
    end
  end,
  {
    nargs = '?',
    complete = function(line)
      local paths = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua', '**/*.lua')
      local files = {}
      for file in paths:gmatch('([^\n]+)') do
        table.insert(files, file:match("^.+/(.+)%."))
      end

      return vim.tbl_filter(
        function(value)
          return vim.startswith(value, line)
        end,
        files
      )
    end,
  }
)
