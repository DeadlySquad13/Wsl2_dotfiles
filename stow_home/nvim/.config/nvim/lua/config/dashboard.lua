-- Don't understand how to get it from vim.
local leader = 'Space'
local localleader = '\\'

local dashboard_items = {
  edit_config = {
    description = {
      icon = '',
      action = 'Edit vim config                     ',
      shortcut = leader..' e v'
    },
    command = 'edit $MYVIMRC'
  },
  find_history = {
    description = {
      icon = '',
      action = 'Recently opened files               ',
      shortcut = leader..' o r'
    },
    command = ''
  },
  find_file = {
    description = {
      icon = '',
      action = 'Find file                           ',
      shortcut = leader..' o f'
    },
    command = ''
  },
  new_file = {
    description = {
      icon = '',
      action = 'New file                            ',
      shortcut = leader..' o n'
    },
    command = ''
  },
  change_colorscheme = {
    description = {
      icon = '',
      action = 'Change colorscheme                  ',
      shortcut = leader..' s t'
    },
    command = ''
  },
  find_word = {
    description = {
      icon = '',
      action = 'Find word                           ',
      shortcut = leader..' f w'
    },
    command = ''
  },
  bookmarks = {
    description = {
      icon = '',
      action = 'Jump to bookmarks                   ',
      shortcut = leader..' g b'
    },
    command = ''
  }
}

local dashboard_custom_section = {}

for key, item in pairs(dashboard_items) do
  local description = item.description
  local icon = description.icon
  local action = description.action
  local shortcut = description.shortcut

  local command = item.command

  dashboard_custom_section[key] = {
    description = { icon..' '..action..shortcut },
    command = command
  }
end

vim.g.dashboard_custom_section = dashboard_custom_section
