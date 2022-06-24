------------------------------------------------------------------
-- General purpose utils (mostly used for writing pretty code). --
------------------------------------------------------------------
local env = require('global')

--- Prints prettily the data and returns it without any changes. Used for
-- testing.
---@param data any data.
---@return data without changes.
_G.P = function (data)
  vim.pretty_print(data)
  return data;
end

local function prequire(plugin_name)
  local plugin_loading_error_handler = function(error)
    local nvim_notify_is_available, nvim_notify = pcall(require, 'notify');

    local notify = vim.notify;
    if nvim_notify_is_available then
      notify = nvim_notify;
    end

    notify('Error in loading plugin ' .. plugin_name .. '!');
  end

  local status_ok, plugin = xpcall(require, plugin_loading_error_handler, plugin_name);

  if not status_ok then
    return status_ok;
  end

  return status_ok, plugin;
end

-- Shortcut for printing variables in a meaningless way: showing contents of a
--   table via vim.inspect. Used log as console.log in js works pretty the same
--   way.
local function log(data)
  vim.pretty_print(data)
end


--- Creates new function with default parameters.
---@ref https://gist.github.com/stuartpb/975399
---@usage:
--- myfunction = fancyparams(
---   {{"a"},{"b",7},{"c",5}},
---   function(a, b, c)
---     print(a, b, c)
---   end
--- );
--- myfunction({ a = 8 )}; -- b and c have defaults!
---
---@param arg_def table with parameters with their default values.
---@param f function to which are default parameters are applied.
---@return new function with default parameters.
local function fancyparams(arg_def,f)
  return function(args)
    local params = {}
    for i=1, #arg_def do
      local paramname = arg_def[i][1] --the name of the first parameter to the function
      local default_value = arg_def[i][2]
      params[i] = args[i] or args[paramname] or default_value
    end
    return f(unpack(params,1,#arg_def))
  end
end

--- Converts path to runtimepath (see `:h runtimepath`) or more specifically to
-- stdpath('config') (see `:h stdpath`).
---@param path that looks like
--`home/dubuntus/.config/nvim/lua/config/incline.lua`
---@return path thats truncated at the beggining (as if starting relatively
-- from stdpath('config')):
-- `lua/config/incline.lua`.
local function convert_to_runtimepath(path)
  local path_with_truncated_runtimepath = string.gsub(path, vim.fn.stdpath('config'), '');

  -- Removing first slash.
  return path_with_truncated_runtimepath:sub(2);
end

local function edit_file(path)
  return vim.cmd('e '..path);
end

local function apply_global_variables(global_variables)
  for name, value in pairs(global_variables) do
    vim.g[name] = value;
  end
end

return {
  prequire = prequire,
  log = log,

  create_augroup = vim.api.nvim_create_augroup,
  create_autocmd = vim.api.nvim_create_autocmd,

  fp = fancyparams,

  convert_to_runtimepath = convert_to_runtimepath,
  edit_file = edit_file,

  apply = {
    variables = {
      global = apply_global_variables,
    },
  },
};

