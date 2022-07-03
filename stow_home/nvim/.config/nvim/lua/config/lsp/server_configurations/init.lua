local custom_server_configurations = {
  sumneko_lua = require('config.lsp.server_configurations.sumneko_lua'),
  pyright = require('config.lsp.server_configurations.pyright'),
  tsserver = require('config.lsp.server_configurations.tsserver'),
  -- cssls = default_server_config,
  -- eslint = default_server_config,
  -- jsonls = require("lsp.jsonls").config,

  -- bashls = default_server_config,

  -- Conflicts with prettier formatting in TS files.
  -- stylelint_lsp = utils.base_config_without_formatting,
}

return custom_server_configurations
