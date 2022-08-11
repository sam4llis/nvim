if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln('The plugin `telescope.nvim` requires Neovim 0.7.0.')
  return
end

local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-q>'] = function(prompt_bufnr)
          actions.smart_send_to_qflist(prompt_bufnr)
          vim.cmd [[ cwindow ]]
        end,
        ['<C-a>'] = function(prompt_bufnr)
          local entry = actions_state.get_selected_entry()
          vim.cmd('argadd ' .. entry.path)
        end,
      },
    },
    prompt_prefix = '     ',
    selection_caret = '  ',
    entry_prefix = '  ',
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.8,
      height = 0.8,
      preview_cutoff = 120,
    },
  },
  pickers = {},
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('arglist')
