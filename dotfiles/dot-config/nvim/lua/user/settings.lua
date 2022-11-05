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
  foldcolumn = 'auto', -- Resize to the minimum amount of folds to display.
  history = 5000, -- Remember more command-line history.
  hlsearch = false, -- Disable search highlighting by default.
  ignorecase = true, -- Case-insensitive search.
  laststatus = 3,
  lazyredraw = true, -- Do not redraw screen while executing macros, etc.
  list = true, -- Enable list mode.
  listchars = 'tab:>-,trail:x,extends:>,precedes:<,nbsp:+,leadmultispace:.',
  mouse = 'a', -- Enable mouse in most contexts.
  number = true, -- Line numbering.
  path = '**', -- Recursively find files.
  pumheight = 5, -- Maximum number of items to show in the popup menu.
  relativenumber = true, -- Show line numbers relative to the active line.
  shiftround = true, -- Round indent to multiples of 'shiftwidth'.
  shiftwidth = 4, -- Default auto-indent space.
  showmode = false, -- Don't show modes in the command line.
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

if not (vim.version().minor < 9) then
  vim.opt.splitkeep = 'screen' -- Keep text on the same screen line on horizontal split.
  vim.opt.diffopt:append('linematch:60')
end

vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+' -- Hide dotfiles in netrw by default.
