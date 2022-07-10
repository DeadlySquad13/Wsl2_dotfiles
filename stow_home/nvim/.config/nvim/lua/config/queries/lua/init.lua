local utils = require('config.queries.utils')
local read_local_query_files, set_query = utils.read_local_query_files, utils.set_query

local new_highlight_query = read_local_query_files('lua', 'highlights')

set_query('lua', 'highlights', new_highlight_query)
require('nvim-treesitter.highlight').set_custom_captures({
  ['keyword.declaration'] = 'TSKeywordDeclaration',
})