local M = {}

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
  print(vim.inspect(data))
end

return {
  prequire = prequire,
};

