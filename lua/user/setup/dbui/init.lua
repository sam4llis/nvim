vim.g.db_ui_winwidth = 42

-- Add database connections to lua/user/setup/dbui/dbs.lua.
pcall(require, 'user.setup.dbui.dbs')
