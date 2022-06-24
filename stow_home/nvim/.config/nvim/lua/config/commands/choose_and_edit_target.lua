local env = require('global');
local convert_to_runtimepath = require('utils').convert_to_runtimepath;
local edit_file = require('utils').edit_file;

--- Open lua module: if only one file exists, jump to it immediately, otherwise
-- open directory.
---@param path (absolute).
---@return
local function open_lua_module(path)
  local path_relative_to_runtimepath = convert_to_runtimepath(path);
  local files = vim.api.nvim_get_runtime_file(path_relative_to_runtimepath..'/*.lua', true);

  -- Can just jump to file, it's anyway the only one existing.
  if #files == 1 then
    return edit_file(files[1]);
  end

  return require('telescope.builtin').find_files({ cwd = path })
end

local function traverse_keymappings_directory()
  return open_lua_module(env.NVIM_KEYMAPPINGS);
end

local function open_plugins()
  vim.cmd(':e ' .. env.NVIM_PLUGINS)
end

local function open_vimrc()
  vim.cmd(':e $MYVIMRC')
end

local function open_config()
  open_lua_module(env.NVIM_LUA_CONFIG);
end

local edit_actions = {
  keymappings = traverse_keymappings_directory,
  plugins = open_plugins,
  vimrc = open_vimrc,
  config = open_config,
}

local edit_targets = {}

local i = 0;

for edit_target,_ in pairs(edit_actions) do
  i = i + 1;
  edit_targets[i] = edit_target;
end

local choose_and_edit_target = function()
  vim.ui.select(edit_targets, {
    prompt = 'Choose target to edit',
    telescope = require("telescope.themes").get_dropdown(),
  }, function(selected)
      if not selected then
        return;
      end
      edit_actions[selected]();
    end
  )
end

return choose_and_edit_target;
