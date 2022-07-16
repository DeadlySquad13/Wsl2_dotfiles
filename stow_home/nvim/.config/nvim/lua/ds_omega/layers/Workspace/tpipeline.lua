local config = require('config.tpipeline')
local tbl_remove_key = require('utils').tbl_remove_key

local vim_settings = tbl_remove_key(config, 'vim_settings')

for name, value in pairs(config) do
  vim.g[name] = value;
end

for name, value in pairs(vim_settings) do
  vim.o[name] = value;
end

