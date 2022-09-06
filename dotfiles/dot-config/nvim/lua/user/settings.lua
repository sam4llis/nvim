--            _   _   _                   _
--   ___  ___| |_| |_(_)_ __   __ _ ___  | |_   _  __ _
--  / __|/ _ \ __| __| | '_ \ / _` / __| | | | | |/ _` |
--  \__ \  __/ |_| |_| | | | | (_| \__ \_| | |_| | (_| |
--  |___/\___|\__|\__|_|_| |_|\__, |___(_)_|\__,_|\__,_|
--                            |___/

local settings = {
  cursorcolumn = false, -- Highlight the active cursor column.
  cursorline = true, -- Highlight the active cursor line.
  completeopt = 'menuone,noinsert,noselect', -- Saner completion experience.
  diffopt = 'internal,context:100,filler,foldcolumn:0,algorithm:patience,vertical',
  fillchars = 'diff:╱', -- Character to fill deleted lines of the diff option.
  foldcolumn = 'auto', -- Resize to the minimum amount of folds to display.
  history = 5000, -- Remember more command-line history.
  hlsearch = false, -- Disable search highlighting by default.
  ignorecase = true, -- Case-insensitive search.
  lazyredraw = true, -- Do not redraw screen while executing macros, etc.
  list = true, -- Enable list mode.
  listchars = 'tab:>-,trail:x,extends:>,precedes:<,nbsp:+,leadmultispace:.',
  mouse = 'a', -- Enable mouse in most contexts.
  number = true, -- Line numbering.
  path = '**', -- Recursively find files.
  relativenumber = true, -- Show line numbers relative to the active line.
  shiftround = true, -- Round indent to multiples of 'shiftwidth'.
  shiftwidth = 4, -- Default auto-indent space.
  showmode = true, -- Show modes in the command line.
  scrolloff = 2, -- Number of screen lines to keep above and below the cursor.
  sidescrolloff = 5, -- The minimum number of screen lines left/right of the cursor.
  signcolumn = 'auto', -- Automatically toggle the sign column when needed.
  smartcase = true, -- Enable smart case sensitivity.
  spell = false, -- Disable spelling by default.
  spelllang = 'en_gb', -- British English for spell checking.
  splitbelow = true, -- Sane split behaviour.
  splitright = true, -- Sane split behaviour.
  tabstop = 4, -- Insert 4 spaces in place of a tab.
  termguicolors = true, -- Enable 24-bit RGB colour.
  updatetime = 50, -- Default swap file backup time.
  winblend = 0, -- Default transparency for floating windows.
  wrap = false, -- Do not word wrap.
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end

if vim.fn.has('nvim-0.7.0') == 1 then
  vim.opt.laststatus = 3
else
  vim.opt.laststatus = 2
  vim.api.nvim_err_writeln('Global statusline requires Neovim 0.7.0')
end

vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+' -- Hide dotfiles in netrw by default.
