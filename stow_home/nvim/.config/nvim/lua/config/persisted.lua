local prequire = require('utils').prequire;

local persisted_status_is_ok, persisted = prequire("persisted");
if not persisted_status_is_ok then 
  return;
end

local ENV = require('global');

persisted.setup({
  -- Unfortunately, SessionLoadLast doesn't work with save_dir even though it's
  --   newer.
  --save_dir = ENV.NVIM_DATA .. '/sessions/', -- directory where session files are saved
  save_dir = vim.fn.expand(ENV.NVIM_DATA .. '/sessions/'), -- directory where session files are saved
  dir = vim.fn.expand(ENV.NVIM_DATA .. "/sessions/"),
  --command = 'VimLeavePre', -- the autocommand for which the session is saved
  --use_git_branch = true, -- create session files based on the branch of the git enabled repository
  --autosave = true, -- automatically save session files when exiting Neovim
  --autoload = false, -- automatically load the session for the cwd on Neovim startup
  --allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
  --ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
  --before_save = function() end, -- function to run before the session is saved to disk
  --after_save = function() end, -- function to run after the session is saved to disk
  --telescope = { -- options for the telescope extension
    --before_source = function(session) end, -- function to run before the session is sourced via telescope
    --after_source = function(session) end, -- function to run after the session is sourced via telescope
  --},
});

-- To load the telescope extension.
local telescope_status_is_ok, telescope = prequire("telescope");
if not telescope_status_is_ok then
  return;
end

telescope.load_extension("persisted");

