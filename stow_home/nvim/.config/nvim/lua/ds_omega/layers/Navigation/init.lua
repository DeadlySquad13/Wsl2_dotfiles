---@class Module
local Navigation = {}

Navigation.plugins = {
  ['marks'] = {
    'chentoast/marks.nvim',
  },

  ['telescope'] = {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  },

  ['rnvimr'] = {
    'kevinhwang91/rnvimr',
  },

  ['neo_tree'] = {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },
}

Navigation.configs = {
  ['marks'] = function()
    require('ds_omega.layers.Navigation.marks')
  end,

  ['telescope'] = function()
    require('ds_omega.layers.Navigation.telescope')
  end,

  ['rnvimr'] = function()
    require('ds_omega.layers.Navigation.rnvimr')
  end,

  ['neo_tree'] = function()
    require('ds_omega.layers.Navigation.neo_tree')
  end,
}

return Navigation
