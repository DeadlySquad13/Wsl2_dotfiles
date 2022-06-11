local M = {}

M.prequire = function (plugin_name)
  local plugin_loading_error_handler = function(error)
    vim.notify('Error in loading plugin ' .. plugin_name .. '!');
  end

  local status_ok, plugin = xpcall(require, plugin_loading_error_handler, plugin_name);

  if not status_ok then
    return status_ok;
  end

  return status_ok, plugin;
end

return M;

