return {
  ['Integrations'] = {
    'toggleterm', -- Terminal integration.
  },

  ['Workspace'] = {
    -- * Status line.
    'tpipeline', -- Move status line to the tmux.
    'lualine', -- Pretty status line in lua.

    -- * Buffers.
    'bufferline', -- Buffer line.
    'jabs', -- Buffer management popup.

    -- * Winbar: statusline at the top of the window.
    'incline',

    -- * Remove Distraction.
    'true_zen', -- Clear screen space from the ui clutter.
    'twilight', -- Dim everything except current block.
  },

  ['WindowManagement'] = {
    'bufdelete', -- Keep window layout after closing the buffer.
    -- Focus on window: keep it dynamically larger, remove numbers, cursor
    --   and signcolumn on inactive windows.
    'focus',
    'window', -- Jump to specified window.
    'winshift', -- Move windows without changing layout.
  },

  ['Navigation'] = {
    -- * Inside  file.
    'quick_scope', -- More efficient jumping inside a line.
    'lightspeed',
    'marks', -- Marks and bookmarks.

    -- * Across files.
    -- - Harpoon?
    'rnvimr', -- Ranger filemanager.
    'neo_tree', -- Browse file tree.

    'rel', -- Jumping to file under cursor.

    -- * Telescope.
    'telescope',
  },

  ['Editing'] = {
    'autopairs', -- Automatically insert brackets.
    'comments', -- Keybindings for commenting.
    'surround', -- Manipulate surrounding elements such as commas and tags.
    'multi_cursors',
  }
}
