if vim.version().minor < 8 then
  vim.notify_once('[treesitter.lua] Neovim 0.8 or higher is required.', vim.log.levels.WARNING)
  return
end

require('nvim-treesitter.configs').setup({
  ensure_installed = {},
  highlight = {
    enable = true,
    custom_captures = {
    },
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        [']vv'] = '@parameter.inner',
        [']vf'] = '@function.outer',
        [']vc'] = '@class.outer',
      },
      swap_previous = {
        ['[vv'] = '@parameter.inner',
        ['[vf'] = '@function.outer',
        ['[vc'] = '@class.outer',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Whether to set jumps in the jumplist.
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code.
    persist_queries = false, -- Whether the query persists across vim sessions.
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
})

-- Override fold queries.
vim.treesitter.set_query("python", "folds", [[
  (expression_statement) @fold
]])

require('nvim-treesitter.parsers').filetype_to_parsername.xml = 'html'
