-- You can add your own plugins here or in other files in this directory!
-- Files next to this one are loaded automatically by the upstream loader below.

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/pmizio/typescript-tools.nvim',
  'https://github.com/andweeb/presence.nvim',
}

require('typescript-tools').setup {}

require('presence').setup {
  auto_update = true,
  neovim_image_text = 'One performative Neovim please 🤓',
  main_image = 'neovim',
  log_level = nil,
  debounce_timeout = 10,
  enable_line_number = false,
  blacklist = {},
  buttons = false,
  file_assets = {},
  show_time = true,
  editing_text = 'Editing file',
  file_explorer_text = 'Browsing files',
  git_commit_text = 'Committing changes',
  plugin_manager_text = 'Managing plugins',
  reading_text = 'Reading file',
  workspace_text = 'Coding rn...',
  line_number_text = 'Line %s out of %s',
}

-- Iterate over all other Lua files in this directory and load them.
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
