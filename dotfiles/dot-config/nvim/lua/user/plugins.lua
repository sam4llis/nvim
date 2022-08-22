--         _             _             _
--   _ __ | |_   _  __ _(_)_ __  ___  | |_   _  __ _
--  | '_ \| | | | |/ _` | | '_ \/ __| | | | | |/ _` |
--  | |_) | | |_| | (_| | | | | \__ \_| | |_| | (_| |
--  | .__/|_|\__,_|\__, |_|_| |_|___(_)_|\__,_|\__,_|
--  |_|            |___/

if vim.fn.empty(vim.fn.glob('~/.config/nvim/autoload/plug.vim')) == 1 then
  vim.cmd('!' .. "sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")
end

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

  -- Vim.
  Plug('joechrisellis/gruvbox')
  Plug('joechrisellis/vim-git-arglist')
  Plug('joechrisellis/vim-searchlist')
  Plug('tpope/vim-abolish')
  Plug('tpope/vim-commentary')
  Plug('tpope/vim-dadbod')
  Plug('tpope/vim-fugitive')
  Plug('tpope/vim-obsession')
  Plug('tpope/vim-projectionist')
  Plug('tpope/vim-ragtag')
  Plug('tpope/vim-repeat')
  Plug('tpope/vim-rhubarb')
  Plug('tpope/vim-rsi')
  Plug('tpope/vim-sleuth')
  Plug('tpope/vim-surround')
  Plug('tpope/vim-unimpaired')
  Plug('tpope/vim-vinegar')

  -- Treesitter.
  if vim.fn.has('nvim-0.7.0') == 1 then
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
    Plug('nvim-treesitter/nvim-treesitter-context')
    Plug('nvim-treesitter/nvim-treesitter-textobjects')
    Plug('nvim-treesitter/playground')
  end

  -- Telescope.
  if vim.fn.has('nvim-0.7.0') == 1 then
    Plug('nvim-lua/plenary.nvim')
    Plug('nvim-telescope/telescope.nvim')
    Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
  end

  -- LSP.
  if vim.fn.has('nvim-0.7.2') == 1 then
    Plug('neovim/nvim-lspconfig')
    Plug('jose-elias-alvarez/null-ls.nvim')
  end

  -- Debugging.
  Plug('mfussenegger/nvim-dap')
  Plug('mfussenegger/nvim-dap-python')
  Plug('rcarriga/nvim-dap-ui')

  -- Miscellaneous.
  Plug('kyazdani42/nvim-web-devicons')
  Plug('lewis6991/gitsigns.nvim')
  Plug('lewis6991/spellsitter.nvim')

  -- My Plugins.
  if vim.fn.has('nvim-0.7.0') == 1 then
    Plug('sam4llis/nvim-cobalt')
    Plug('sam4llis/nvim-lua-gf')
    Plug('sam4llis/nvim-tundra')
    Plug('sam4llis/telescope-arglist.nvim')
  end

vim.call('plug#end')
