---@class Module
local Editing = {}

Editing.plugins = {
  ['autopairs'] = {
    'windwp/nvim-autopairs',
  },

  ['comments'] = {
    'numToStr/Comment.nvim',
    event = 'VimEnter',

    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      event = 'VimEnter',

      requires = 'nvim-treesitter/nvim-treesitter',
    },
  },

  ['surround'] = {
    'kylechui/nvim-surround',
  },

  ['multi_cursors'] = {
    'mg979/vim-visual-multi',
    branch = 'master',
  },

  ['abolish'] = {
    'tpope/vim-abolish',
  }
}

Editing.configs = {
  ['autopairs'] = function()
    require('ds_omega.layers.Editing.autopairs')
  end,

  ['comments'] = function()
    require('ds_omega.layers.Editing.comments')
  end,

  ['surround'] = function()
    require('ds_omega.layers.Editing.surround')
  end,

  ['multi_cursors'] = function()
    require('ds_omega.layers.Editing.multi_cursors')
  end,

  ['abolish'] = function()
    require('ds_omega.layers.Editing.abolish')
  end,
}

return Editing
