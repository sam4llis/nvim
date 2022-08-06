if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln("The plugin `treesitter` requires Neovim 0.7.0.")
  return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = { },
  highlight = {
    enable = true,
    custom_captures = {
    },
  },
  indent = {
    enable = false,
  },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["]vv"] = "@parameter.inner",
        ["]vf"] = "@funtion.outer",
        ["]vc"] = "@class.outer",
      },
      swap_previous = {
        ["[vv"] = "@parameter.inner",
        ["[vf"] = "@function.outer",
        ["[vc"] = "@class.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Whether to set jumps in the jumplist.
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
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
}

require('vim.treesitter.query').set_query("markdown", "highlights", [[
  (atx_heading (inline) @text.title)
  (setext_heading (paragraph) @text.title)
  [
    (atx_h1_marker)
    (atx_h2_marker)
    (atx_h3_marker)
    (atx_h4_marker)
    (atx_h5_marker)
    (atx_h6_marker)
    (setext_h1_underline)
    (setext_h2_underline)
  ] @punctuation.special

  [
    (link_title)
    (indented_code_block)
    (fenced_code_block)
  ] @text.literal

  [
    (fenced_code_block_delimiter)
  ] @punctuation.delimiter

  (code_fence_content) @none

  [
    (link_destination)
  ] @text.uri

  [
    (link_label)
  ] @text.reference

  [
    (list_marker_plus)
    (list_marker_minus)
    (list_marker_star)
    (list_marker_dot)
    (list_marker_parenthesis)
    (thematic_break)
  ] @punctuation.special

  [
    (block_continuation)
    (block_quote_marker)
  ] @punctuation.special

  [
    (backslash_escape)
  ] @string.escape
]])
