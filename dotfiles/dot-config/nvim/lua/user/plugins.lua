--         _             _             _
--   _ __ | |_   _  __ _(_)_ __  ___  | |_   _  __ _
--  | '_ \| | | | |/ _` | | '_ \/ __| | | | | |/ _` |
--  | |_) | | |_| | (_| | | | | \__ \_| | |_| | (_| |
--  | .__/|_|\__,_|\__, |_|_| |_|___(_)_|\__,_|\__,_|
--  |_|            |___/

local os = vim.loop.os_uname().sysname
if vim.fn.empty(vim.fn.glob(vim.fn.stdpath('config') .. '/autoload/plug.vim')) == 1 then
  if os == 'Darwin' then
    vim.cmd("!sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")
  elseif os == 'Windows_NT' then
    vim.cmd('silent !md ' .. vim.fn.expand(vim.fn.stdpath('config') .. '/autoload'))
    vim.cmd('silent !powershell.exe Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile ' .. vim.fn.expand(vim.fn.stdpath('config') .. '/autoload/plug.vim'))
  end
end

local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- Vim.
Plug('joechrisellis/gruvbox')
Plug('joechrisellis/vim-git-arglist')
Plug('joechrisellis/vim-searchlist')
Plug('tpope/vim-abolish')
Plug('tpope/vim-commentary')
Plug('tpope/vim-dadbod')
Plug('kristijanhusak/vim-dadbod-ui')
Plug('kristijanhusak/vim-dadbod-completion')
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
if not (vim.version().minor < 8) then
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
  Plug('nvim-treesitter/nvim-treesitter-context')
  Plug('nvim-treesitter/nvim-treesitter-textobjects')
  Plug('nvim-treesitter/playground')
end

-- Telescope.
if not (vim.version().minor < 7) then
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim')
  -- Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
end

-- LSP.
if not (vim.version().minor < 7) then
  Plug('neovim/nvim-lspconfig')
  Plug('joechrisellis/lsp-format-modifications.nvim')
  Plug('jose-elias-alvarez/null-ls.nvim')
end

if not (vim.version().minor < 7) then
  Plug('hrsh7th/nvim-cmp')
  Plug('hrsh7th/cmp-nvim-lsp')
end

-- Debugging.
Plug('mfussenegger/nvim-dap')
Plug('mfussenegger/nvim-dap-python')
Plug('rcarriga/nvim-dap-ui')

-- Miscellaneous.
Plug('kyazdani42/nvim-web-devicons')
Plug('lewis6991/gitsigns.nvim')

-- My Plugins.
if not (vim.version().minor < 7) then
  Plug('sam4llis/nvim-cobalt')
  Plug('sam4llis/nvim-lua-gf')
  Plug('sam4llis/nvim-tundra', { ['branch'] = 'dev' })
  Plug('sam4llis/telescope-arglist.nvim')
end

vim.call('plug#end')
