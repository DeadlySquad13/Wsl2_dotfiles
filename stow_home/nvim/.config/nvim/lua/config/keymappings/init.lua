--local prequire = require('utils').prequire;
local tinykeymap_transitive_catalizator = '.';

-- Split line by delimiter: '<,'>s;\(delimiter\) ;\1\r;g
-- Uppercase all comments and add dot at the end:
--   '<,'>s;^\(-- \w\)\(.*\);\U\1\e\2.;
-- # Buffer.
local buffer_mappings = {
  name = 'Buffer',

  -- Deletes buffer without closing vim if it was in the only window.
  d = { ':Bdelete<cr>', 'Delete' },

  -- @see{the lua api at @link{https://github.com/akinsho/bufferline.nvim/blob/main/lua/bufferline.lua}}
  --p = { function() bufferline.pick_buffer() end, 'Pick' },
  p = { '<cmd>BufferLinePick<cr>', 'Pick' },
}

local comment_mappings = {
  d = { ':Neogen<cr>', 'Create Documentation comment' },
}

local e_mappings = {
  name = 'Edit',

  e = { ':ChooseAndEditConfigs<cr>', 'Choose and Edit configs'},
  -- Open vimrc in vertical split.
  v = { '<cmd>vsplit $MYVIMRC<cr>', 'Vimrc' },
  s = { '<cmd>UltiSnipsEdit<cr>', 'Snippets definitions'},
  S = { '<cmd>UltiSnipsEdit!<cr>', 'Choose Snippets definitions'},
}

-- # File.
-- Buffer mappings are mostly used, for now don't know what to place here.
local file_mappings = {
  name = 'File'
}

-- # Go. Movement across files.
local go_mappings = {
  name = 'Go',
  -- * Rel.vim /home/dubuntus/.vim/plugged/rel.vim/plugin/rel.vim
  l = { "<Plug>(Rel)", "Link" }
}

-- # Help. Show help pages, documentation. Can lead out of the application,
-- for example, in browser.
local help_mappings = {
  name = 'Help',

  -- `<c-r><c-w>` won't work on namespaced commands like 
  --   vim.split - it will send you to vim or split depending on your cursor
  --   location. Default command K can work on visually selected text solving
  --   this issue. Unfortunately, I can't get visually selected by myself, it
  --   seems complicated to achieve with marks.
  -- Maybe this might help:
  --   https://github.com/theHamsta/nvim-treesitter/blob/a5f2970d7af947c066fb65aef2220335008242b7/lua/nvim-treesitter/incremental_selection.lua#L22-L30
  -- But here author gets only range, I still don't understand how to get the
  --   text by that range.
  -- Here author gets text somehow but in vimscript:
  --   https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
  --Should be `:set keywordprg=:help` (on Linux will be `:Man` by default!)
  v = { 'K', 'Vim help' },
  m = { ':Man <c-r><c-w><cr>', 'Man page' },
}

-- # Jump. Movement inside file.
local jump_mappings = {
  name = 'Jump',
}

-- # Rename. Search and replace mappings.
local rename_mappings = {
  name = 'Rename',

  -- Current word under cursor.
  w = { [[:%s;\<<c-r><c-w>\>;;g<left><left>]], 'Current word under cursor', silent = false },
  -- vnoremap <leader>sw <esc>:%s;\<<c-r><c-w>\>;;g<left><left>
  -- Don't really remember why I needed it...
  t = { [[:%s;<\w*>\(<\\\w*>\)\?;;g<left><left>]], 'Tag' },
}

-- # Session. Everything related to sessions, saving, sourcing...
-- Change from silent to vim.notify?
local session_mappings = {
  name = 'Session',

  w = { ':w<cr>', 'Write file' },
  v = { ':source $MYVIMRC<cr>', 'Source Vimrc', silent = false },
  V = { ':w<cr><cmd>source $MYVIMRC<cr>', 'Save current file and source Vimrc', silent = false },
  -- Source current file (indented for lua file).

  s = { ':source %<cr>', 'Source current file', silent = false },
  -- Recompile settings after changing Packer configuration.
  p = { ':source $HOME/.config/nvim/lua/plugins.lua<cr>:PackerCompile<cr>', 'Recompile packer', silent = false },
}

-- # Toggle. Mappings that toggle features.
local toggle_mappings = {
  name = 'Toggle',

  f = { ':FocusToggle<cr>', 'Focus' },
  i = { function() require('incline').toggle() end, 'Incline (winbar)' },
}

-- # Navigation. Helps find things, used as lookup table (navigation panel).
local navigation_mappings = {
  name = 'Navigation',
  -- * Telescope.
  f = { function() builtin.find_files() end, 'Find in current directory' },
  s = { function() require('session-lens').search_session() end, 'Session search' },
  g = { function() builtin.live_grep() end, 'Live grep' },
  b = { function() builtin.buffers() end, 'Buffers' },
  h = { function() builtin.help_tags() end, 'Help tags' },
  t = { function() builtin.treesitter() end, 'Treesitter' },
}

-- # Major. Like major mode in spacemacs: filetype mappings.
local major_mappings = {
  name = 'Major',
}

-- * Rnvimr.
-- nmap <leader><c-\> :RnvimrToggle<cr>

--  " Find files relative to root directory (don't understand how lua functions
--  "   work).
--  "lua <<EOF
--  "my_fd = function(opts)
--    "opts = opts or {}
--    "opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
--    "require'telescope.builtin'.find_files(opts)
--  "end
--  "EOF
--
local yank_mappings = { '<Plug>YADefault', 'Native Yank' }

local z_mappings = {
  h = {
    [tinykeymap_transitive_catalizator] = { 'Horizontal Scroll Mode' }
  }
}

-- Historically ',' for me is a keybind for settings.
local settings_mappings = {
  name = 'Settings',
  -- Colors.
  c = { '<cmd>highlight<cr>', 'Show highlight groups colors' },
  --['*'] = { function() vim.fn['SynStack']() end, 'Show highlight groups under the cursor' }
  ['*'] = { ':TSHighlightCapturesUnderCursor<cr>', 'Show highlight groups under the cursor' }
}

local window_mappings = {
  -- List of windows like in tmux?
  --w = {  },

  -- Made it similar to tmux, even though there's ctrl-w_w shortcut in vim for
  -- such jump.
  o = { [[:lua require('nvim-window').pick()<CR>]], 'Pick window' },
  ['c-o'] = { [[:lua require('nvim-window').pick()<CR>]], 'Pick window' },

  [tinykeymap_transitive_catalizator] = { 'Window Mode' },
}

local mappings = {
  name = 'Main',

  ['<leader>'] = {
    name = 'Leader',
    -- a = a_mappings,
    b = buffer_mappings,
    c = comment_mappings, -- <leader><c-/> can be used instead if there's a candidate for `c`.
    -- d = d_mappings,
    e = e_mappings,
    f = file_mappings,
    g = go_mappings,
    h = help_mappings,
    -- i = i_mappings,
    j = jump_mappings,
    -- k = k_mappings,
    -- l = l_mappings,
    m = major_mappings,
    n = navigation_mappings,
    -- o = o_mappings,
    -- p = p_mappings,
    -- q = q_mappings,
    r = rename_mappings,
    s = session_mappings,
    t = toggle_mappings,
    -- u = u_mappings,
    -- v = v_mappings,
    -- w = w_mappings,
    -- x = x_mappings,
    y = yank_mappings,
    z = z_mappings,

    [','] = settings_mappings,
  },

  -- a = a_mappings,
  -- b = b_mappings,
  -- c = c_mappings,
  -- d = d_mappings,
  -- e = e_mappings,
  -- f = f_mappings,
  -- g = g_mappings,
  -- h = h_mappings,
  -- i = i_mappings,
  -- j = j_mappings,
  -- k = k_mappings,
  -- l = l_mappings,
  -- m = m_mappings,
  -- n = n_mappings,
  -- o = o_mappings,
  -- p = p_mappings,
  -- q = q_mappings,
  -- r = r_mappings,
  -- s = s_mappings,
  -- t = t_mappings,
  -- u = u_mappings,
  -- v = v_mappings,
  --w = w_mappings,
  -- x = x_mappings,
  -- y = y_mappings,
  -- z = z_mappings,

  ['<c-w>'] = window_mappings
}

local x_mappings = {
  name = 'Main',

  ['<leader>'] = {
    name = 'Leader',
    -- a = a_mappings,
    -- b = buffer_mappings,
    c = comment_mappings, -- <leader><c-/> can be used instead if there's a candidate for `c`.
    -- d = d_mappings,
    -- e = e_mappings,
    -- f = file_mappings,
    -- g = go_mappings,
    -- h = help_mappings,
    -- i = i_mappings,
    -- j = jump_mappings,
    -- k = k_mappings,
    -- l = l_mappings,
    -- m = major_mappings,
    -- n = navigation_mappings,
    -- o = o_mappings,
    -- p = p_mappings,
    -- q = q_mappings,
    -- r = r_mappings,
    -- s = s_mappings,
    -- t = toggle_mappings,
    -- u = u_mappings,
    -- v = v_mappings,
    -- w = w_mappings,
    -- x = x_mappings,
    y = yank_mappings,
    -- z = z_mappings,

    -- [','] = settings_mappings,
  },

  -- a = a_mappings,
  -- b = b_mappings,
  -- c = c_mappings,
  -- d = d_mappings,
  -- e = e_mappings,
  -- f = f_mappings,
  -- g = g_mappings,
  -- h = h_mappings,
  -- i = i_mappings,
  -- j = j_mappings,
  -- k = k_mappings,
  -- l = l_mappings,
  -- m = m_mappings,
  -- n = n_mappings,
  -- o = o_mappings,
  -- p = p_mappings,
  -- q = q_mappings,
  -- r = r_mappings,
  -- s = s_mappings,
  -- t = t_mappings,
  -- u = u_mappings,
  -- v = v_mappings,
  -- w = w_mappings,
  -- x = x_mappings,
  -- y = y_mappings,
  -- z = z_mappings,

  -- ['<c-w>'] = {
    -- [tinykeymap_transitive_catalizator] = { 'Window Mode' },
  -- }
}

return {
  n = mappings,
  x = x_mappings,
}