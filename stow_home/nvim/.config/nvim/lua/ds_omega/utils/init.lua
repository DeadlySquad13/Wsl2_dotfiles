-- local prequire = require('utils').prequire

local function simple_plugin_setup(plugin_name, config_relative_path)
  local plugin = require(plugin_name)

  -- if not plugin_is_available then
  --   return
  -- end
  local config_path = 'config.' .. config_relative_path
  local config_is_available, config = pcall(require, config_path)
  if not config_is_available then
    config = {}
    notify(
      'Config for plugin `' .. plugin_name .. '` on path `' .. config_path .. '` does not exist!\nReverting to default configuration.',
      vim.log.levels.WARN,
      {
        title = 'Core',
      }
    )
  end

  plugin.setup(config)
end

return {
  simple_plugin_setup = simple_plugin_setup,
}
