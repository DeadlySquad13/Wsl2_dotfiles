set nocompatible
" General.
" - Enable settings for specific filetypes.
filetype plugin on
set encoding=utf-8

" Don't parse long lines for syntax highlight.
set synmaxcol=256
syntax sync minlines=256

" Behave like smartcase when adding word to dictionary.
if has('syntax')
  set spellcapcheck=
endif

set spell spelllang=en_us,ru_ru
" Think of camelCased words as separate words (camel and Cased will be parsed). 
set spelloptions=camel

" Insert only one space after joining lines ending with '.', '?'...
set nojoinspaces

" Gutter.
set number relativenumber

set noswapfile

" Number of lines visible before edge of viewport.
set scrolloff=5
set sidescrolloff=3

" To much hassle with setting nice wrapping, too much inconsistencies across
"   different environments. Just format text yourself and make people on
"   github happier.
" In case someone sends you unformatted text, format it or use horizontal
"   commands.
set nowrap

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix

" - Persistant undo.
set undodir=~/.config/.nvim/undo
set undofile

" - Persistant buffers.
set hidden

" - Try to reuse windows / tabs when switching buffers.
set switchbuf=usetab

" Motions that are allowed to cross line boundaries.
"   Go the end of the previous line / start of the next line easier.
set whichwrap+=h,l

" Give freedom to visual mod by allowing it to travel when there's no text.
if has('virtualedit')
  set virtualedit=block
endif

" Plugins.
call plug#begin('~/.vim/plugged')
  " General.
  " * Open and write files with sudo.
  Plug 'lambdalisue/suda.vim'

  Plug 'tpope/vim-repeat'
  Plug 'tomtom/tinykeymap_vim'

  " * Starting page.
  "Plug 'mhinz/vim-startify'
  Plug 'glepnir/dashboard-nvim'

  " * Sessions.
  "Plug 'rmagatti/auto-session'

  " * Session management.
  "Plug 'rmagatti/session-lens'

  " * Russian layout.
  Plug 'powerman/vim-plugin-ruscmd'

  " LSP
  Plug 'neovim/nvim-lspconfig'

  " * Snippets.
  Plug 'SirVer/ultisnips'
  " - Collections of snippets.
  Plug 'honza/vim-snippets'

  " * Autocomplete
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  " for ultisnips users.
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  "" For vsnip users.
  "Plug 'hrsh7th/cmp-vsnip'
  "Plug 'hrsh7th/vim-vsnip'

  " For luasnip users.
  " Plug 'L3MON4D3/LuaSnip'
  " Plug 'saadparwaiz1/cmp_luasnip'

  " For snippy users.
  " Plug 'dcampos/nvim-snippy'
  " Plug 'dcampos/cmp-snippy'

  " Coding.
  " * Brackets.
  Plug 'jiangmiao/auto-pairs'

  " * Comments.
  Plug 'preservim/nerdcommenter'

  " * Surround.
  Plug 'tpope/vim-surround'

  " * Find.
  Plug 'gennaro-tedesco/nvim-peekup'

  " * Batching.
  Plug 'terryma/vim-expand-region'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " * Permutations.
  Plug 'tpope/vim-abolish'

  " * Formatting.
  Plug 'junegunn/vim-easy-align'

  " * Motion.
  Plug 'tjdevries/train.nvim'
  Plug 'ggandor/lightspeed.nvim'

  " # Targets.
  Plug 'wellle/targets.vim'
  " Textobj-user extensions.
  Plug 'kana/vim-textobj-user'
  " - Columns.
  Plug 'idbrii/textobj-word-column.vim'
  " - Indented paragraph.
  Plug 'pianohacker/vim-textobj-indented-paragraph'
  " - Indents.
  Plug 'kana/vim-textobj-indent'

  " * Case delimited and _ delimited words.
  Plug 'chaoren/vim-wordmotion'

  " # Navigation.
  " * Inside  file.
  " * Across files.
  Plug 'kevinhwang91/rnvimr'
  Plug 'preservim/nerdtree'

  " * Telescope deps.
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

  " - Jumping to file under cursor.
  Plug 'aklt/rel.vim'

  " Markdown.
  Plug 'plasticboy/vim-markdown'
  " Visuals.
  " * Highlight range of an exmode command.
  Plug 'winston0410/cmd-parser.nvim'
  Plug 'winston0410/range-highlight.nvim'

  " * Workspace.
  Plug 'Pocco81/TrueZen.nvim'
  Plug 'folke/twilight.nvim'
  " * Status line.
  Plug 'vim-airline/vim-airline'
  " * Theme.
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'vim-airline/vim-airline-themes'
  " - Helpers for creating a theme.
  Plug 'tjdevries/colorbuddy.nvim'

  " * Highlight colors.
  Plug 'norcalli/nvim-colorizer.lua'
  " * Hide cursorline during moving, highlight words under cursor.
  Plug 'yamatsum/nvim-cursorline'
  " * Brackets.
  Plug 'p00f/nvim-ts-rainbow'
  " * Indents.
  Plug 'lukas-reineke/indent-blankline.nvim'
  " * Icons. (!) Should be loaded last (after nerd-tree, airline, etc...).
  "   Nerd patched fonts required.
  Plug 'ryanoasis/vim-devicons' 
call plug#end()

" Autocompletion.

" General keybindings.
let mapleader=' '
let maplocalleader='\'

" Search for item under cursor in vim docs (:help).
" 'investigate help'
noremap <leader>gih K

"source 'plug-config.vim'
" Starting screen.
" * Dashboard
" - Select which fuzzy search plugins to apply.
let g:dashboard_default_executive='telescope'
" - Custom sections (commands).
"let g:dashboard_custom_section={
  "\ 'edit_config': {
      "\ 'description': [' Edit config                 SPC e c'],
      "\ 'command': ':e $MYVIMRC' }
  "\ }
"let g:dashboard_custom_section={
      "\ 'a': {'description': [ "  Find File                        leader f f" ], 'command': "Telescope find_files"},
      "\ 'b': {'description': [ "  Recents                          leader f h" ], 'command': "Telescope oldfiles"},
      "\ 'c': {'description': [ "  Find Word                        leader f g" ], 'command': "Telescope live_grep"},
      "\ 'd': {'description': [ "  New File                         leader e n" ], 'command': "DashboardNewFile"},
      "\ 'e': {'description': [ "  Bookmarks                        leader m  " ], 'command': "Telescope marks"},
      "\ 'f': {'description': [ "  Load Last Session                leader l  " ], 'command': "SessionLoad"},
      "\ 'g': {'description': [ "  Update Plugins                   leader u  " ], 'command': "PlugUpdate"},
      "\ 'h': {'description': [ "  Settings                         leader e v" ], 'command': "edit $MYVIMRC"},
      "\ 'i': {'description': [ "  Exit                             leader q  " ], 'command': "exit"}
    "\ }
let s:dashboard_shortcut={}

let s:dashboard_shortcut['last_session'] = 'SPC s l'
let s:dashboard_shortcut['find_history'] = 'SPC f h'
let s:dashboard_shortcut['find_file'] = 'SPC f f'
let s:dashboard_shortcut['new_file'] = 'SPC c n'
let s:dashboard_shortcut['change_colorscheme'] = 'SPC t c'
let s:dashboard_shortcut['find_word'] = 'SPC f a'
let s:dashboard_shortcut['book_marks'] = 'SPC f b'

let s:dashboard_shortcut_icon={
  \'last_session': ' ',
  \'find_history': ' ',
  \'find_file': ' ',
  \'new_file': ' ',
  \'change_colorscheme': ' ',
  \'find_word': ' ',
  \'book_marks': ' '
\}

lua <<EOF
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
EOF

augroup Dashboard
     autocmd! * <buffer>
     autocmd User dashboardReady let &l:stl = 'Dashboard'
     autocmd User dashboardReady nnoremap <buffer> <leader>qe :exit<cr>
     "autocmd User dashboardReady nnoremap <buffer> <leader>u <cmd>PackerUpdate<CR>
     autocmd User dashboardReady nnoremap <buffer> <leader>l <cmd>SessionLoad<CR>
augroup END

" - Custom header.
let g:dashboard_custom_header=[
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                    ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣶⣶⣿⡟⠀                   ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣦⣄⠀⣀⣠⣤⣤⣶⣶⣶⣶⣶⣴⣾⣿⣿⣿⣿⣿⣿⡟⠁⠀                   ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡿⠯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⡟⠀⠀    ___  ___________',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⡀⢨⣿⣿⡃⠀⠀⠀⠀ / _ \/ __<  /_  /',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀/ // /\ \ / //_ < ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢫⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀/____/___//_/____/ ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣇⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢇⣿⣿⣿⣿⡈⣻⡝⢿⣿⣿⢿⣟⣹⣁⢀⠘⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⠇⣿⣿⣿⠻⣿⣿⠢⠁⠉⠛⠛⠻⣿⣿⠿⠋⠓⠹⢋⡽⢹⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⢾⡏⢠⠍⢡⣳⡟⠀⠀⠀⠀⠀⠀⠁⠉⠀⠠⢆⠐⠍⠒⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⡘⠐⠁⠀⢁⡋⠄⠀⠀⠀⠀⠀⠀⠀⠀⠁⠒⡀⠂⠀⠀⢹⣿⣿⣿⣿⡿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡀⣻⣄⣣⡀⠻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠡⠀⠀⠀⠀⣸⣿⣿⣿⣿⠃⠡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣄⠀⠀⠈⠳⣦⠉⠀⠀⠀⢀⠠⡰⠁⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⡀⠀⠓⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢸⣟⣀⡑⢄⠀⠀⢻⡇⣴⣶⣿⡆⡈⠀⠀⠀⠀⣰⣿⣿⣿⣿⡿⢀⡟⠁⠀⠀⠀⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠁⠀⠀⠈⠙⣾⠀⣀⡼⢸⣿⣿⣿⣿⣿⡀⠀⠀⣸⣿⣿⣿⣿⡟⣠⡟⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠀⠘⢸⠑⡁⢸⣿⣿⣿⣿⣿⠀⠉⠁⢸⣿⣿⣿⣿⣷⣿⠁⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠶⠁⠀⠀⠀⠈⠀⡇⠀⠀⠁⠸⣹⣿⡿⡿⣿⠀⠀⠀⢸⣿⣿⣿⣿⠏⣿⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⠇⠀⠀⠀⠀⢱⠀⠀⠀⠀⠆⢿⣣⡄⠀⣺⠀⠀⠀⠘⣿⣿⣿⡟⢰⡇⡇⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣆⢠⠀⠀⠀⣀⡜⠀⠀⠀⠀⢀⣆⣿⡶⠾⢻⠀⠀⠀⠀⢸⣿⣿⣧⣸⣧⡃⠀⢀⣀⣠⣤⣄⡀⡆⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⡷⣄⠀⠀⠇⠀⠀⠀⠀⢺⣿⡿⠀⠀⢀⠀⠀⠀⠀⠈⣿⣿⠛⣿⣯⠖⠊⠉⠀⠀⠀⣼⠙⠢⡀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⢠⣇⠈⠳⡼⠀⠀⠀⠀⠀⢸⣿⠃⡆⠀⢸⠀⠀⠀⠀⠀⢻⣿⣴⠟⠀⠀⠀⠀⠀⠀⣰⣿⠀⠀⡁⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⢿⠀⠀⠃⠀⠀⠀⠠⠄⢻⠇⢀⠁⠀⢸⠀⠀⠀⠀⠀⠘⣿⡇⠀⠀⠀⠀⠀⠀⠠⣸⢸⡤⠊⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠤⡈⠀⠀⠀⠀⠀⠀⢸⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢛⡟⠦⠤⠂⠀⠀⣠⠗⡏⠁⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠀⠀⠀⠀⠀⠀⢸⡀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡌⠢⠀⠀⠀⣰⣿⣔⣀⣀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠀⠀⠀⠀⠀⠀⠀⢸⣷⣇⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢘⠀⠀⠀⣰⣿⣏⢌⠀⠀⠀⠆             ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣦⣴⣿⡀⠀⠀⠀⠀⠀⠀⢸⡇⠀⣰⣿⣿⣷⣼⣀⡀⠜⠲⠀⠀⠀⠀⠀⠀⠀⠀     ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠀⠀⠀⠀⠀⠠⠛⠛⠋⠙⠿⣿⣷⡀⠀⠀⠀⠀⠀⠘⢀⣼⣿⣿⣿⣿⡝⠃⠀⠀⣼⠀⠀    ⠀⠀   ⠀ ',
  \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣴⣶⣄⠀⠀⠀⣠⣷⣶⣶⣶⣶⣶⣶⣿⣷⡄⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋     ',
  \'⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀      ',
  \'⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉          '
\]

let g:dashboard_custom_footer=[
    \ 'I did your vim operator exercises and my hand ended up stuck inside my ass.
    \ What should I do?',
    \ '',
    \ '                                         - Vim more.'
  \ ]

" Session.
" * Save automatically.
"function! MakeSession()
  "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  "if (filewritable(b:sessiondir) != 2)
    "exe 'silent !mkdir -p ' b:sessiondir
    "redraw!
  "endif
  "let b:filename = b:sessiondir . '/session.vim'
  "exe "mksession! " . b:filename
"endfunction

"" * Load automatically.
"function! LoadSession()
  "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  "let b:sessionfile = b:sessiondir . "/session.vim"
  "if (filereadable(b:sessionfile))
    "exe 'source ' b:sessionfile
  "else
    "echo "No session loaded."
  "endif
"endfunction

"" Adding automatons for when entering or leaving Vim
"if(argc() == 0)
  "au VimEnter * nested :call LoadSession()
"endif
"au VimLeave * :call MakeSession()

" LSP
" * Autocomplete.
set completeopt=menu,menuone,noselect

" Use omni completion provided by lsp.
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

lua <<EOF
  -- Setup nvim-cmp.
-- Not quite understand what to do with it.
-- within packer init {{{
-- use {'SirVer/ultisnips',
--     requires = {{'honza/vim-snippets', rtp = '.'}},
--     config = function()      
--       vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
--       vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
--       vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
--       vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
--       vim.g.UltiSnipsRemoveSelectModeMappings = 0
--     end
-- }
-- }}}
  local cmp = require('cmp')

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local cmp = require('cmp')

  cmp.setup {
    snippet = {
      expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
      }, {
        { name = 'buffer' },
      }),

    mapping = {
      ["<Tab>"] = cmp.mapping({
          c = function(fallback)
            if cmp.visible() then
                -- cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              -- `select = true` enables immediate autocomplete without selection
              --   <c-space><tab> gives the first result.
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
              fallback()
            end
          end,

          i = function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end,

          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end
      }),

      ["<S-Tab>"] = cmp.mapping({
        c = function()
          if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          end
        end,

        i = function(fallback)
          if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
          else
              fallback()
          end
        end,

        s = function(fallback)
          if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
          else
              fallback()
          end
        end
      }),

      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),

      ['<C-n>'] = cmp.mapping({
        c = function()
          if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
          else
              vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
          end
        end,

        i = function(fallback)
          if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
          else
              fallback()
          end
        end
      }),
      ['<C-p>'] = cmp.mapping({
        c = function()
          if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Replace })
          else
              vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
          end
        end,

        i = function(fallback)
          if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Replace })
          else
              fallback()
          end
        end
      }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),

      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),

      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.close(),
        c = cmp.mapping.close()
      }),

      -- ['<CR>'] = cmp.mapping({
      --   i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      --
      --   c = function(fallback)
      --     if cmp.visible() then
      --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
      --     else
      --       fallback()
      --     end
      --   end
      -- }),
    },
  }

  -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    completion = { autocomplete = false },
    sources = {
      -- { name = 'buffer' }
      { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
    }
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    completion = { autocomplete = false },
    sources = cmp.config.sources({
      { name = 'path' }
      }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- * Python
  require('lspconfig').pylsp.setup{
    capabilities = capabilities
  }
EOF

" * General.
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" * Investigation.
" - & is ? in Russian layout.
nnoremap <silent> <leader>gi& <cmd>lua vim.lsp.buf.hover()<CR>
" - Implementation.
nnoremap <silent> <leader>gii <cmd>lua vim.lsp.buf.implementation()<CR>

" - Declaration.
nnoremap <silent> <leader>giD <cmd>lua vim.lsp.buf.declaration()<CR>

" - Type definition.
nnoremap <silent> <leader>git <cmd>lua vim.lsp.buf.type_definition()<CR>

" - Definition.
nnoremap <silent> <leader>gid <cmd>lua vim.lsp.buf.definition()<CR>

" * Searching.
nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


" # Treesitter.
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python' },
  ignore_install = { }, -- List of parsers to ignore installing
  indent = {
    enable = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {  }, -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  -- Brackets.
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
EOF
" Coding
" * Wordmotion.
" relevant only with smart find (for example, from vim-lighspeed)
" \ and overwrites ; of vim-targets.
let g:wordmotion_prefix = ';'

" # Formatting.
" * Easy Align.
" - Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" * Copy all file into system register (*).
nnoremap y% gg"*yG

" * Matching braces.
packadd! matchit

"unmap +
" * Expand region.
call tinykeymap#EnterMap('ExpandRegion', '<a-v>',
      \ { 'name': 'expand region mode' })
call tinykeymap#Map('ExpandRegion', 'v',
      \ 'execute "normal \<Plug>(expand_region_expand)"',
      \ { 'desc': 'Expand selection' })
call tinykeymap#Map('ExpandRegion', 'V',
      \ 'execute "normal \<Plug>(expand_region_shrink)"',
      \ { 'desc': 'Shrink selection' })

" * Surround.
" - visually select what you want to wrap and then press S- to tigger
"   the - surrounding. It will then prompt you for a 'start' and 'ending' text.
let g:surround_{char2nr('-')} = "\1start: \1\r\2end: \2"

" * Create a new line above the current one without exiting normal mode.
map <Leader>O O<Esc>j

" * Create a new line below the current one without exiting normal mode.
map <Leader>o o<Esc>k

" * Keep visual mode after indent.
vnoremap > >gv
vnoremap < <gv

" * Select just pasted text in last used mode [if you used linewise selection
" - V, if characterwise - v,..].
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" * Yanking.
" - Keep cursor at the same place after yanking.
vmap y ygv<esc>

" - Make Y behave similar to D in normal mode.
nnoremap Y y$

" * Open new file in vertical split (similar to built-in <c-w>n).
nnoremap <c-w>v :vnew<cr>

" * Remaping line concatenation for use of j with modifier in non-vim apps.
noremap <a-j> J

" * Search and replace:
" - Current word under cursor.
nnoremap <leader>sw :%s;\<<c-r><c-w>\>;;g<left><left>
"vnoremap <leader>sw <esc>:%s;\<<c-r><c-w>\>;;g<left><left>

" NERDCommenter.
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" * Shortcuts for settings.
" - Open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" - Source vimrc.
nnoremap <leader>sv :source $MYVIMRC<cr>

" Navigation.
" # Between files.
" * Rel.vim
" - "go link".
nmap <leader>gl <Plug>(Rel)
" # Across files.
" * Rnvimr.
" - Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
nmap <leader><c-\> :RnvimrToggle<cr>
" * NERDTree.
" - Start NERDTree automatically. If a file is specified, move the cursor to
"     its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" - Place on the right.
let g:NERDTreeWinPos = "right"

" * Telescope.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fs <cmd>lua require('session-lens').search_session()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fp <cmd>lua require('telescope.builtin').treesitter()<cr>

" Find files relative to root directory (don't understand how lua functions
"   work).
"lua <<EOF
"my_fd = function(opts)
  "opts = opts or {}
  "opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  "require'telescope.builtin'.find_files(opts)
"end
"EOF

" # Inside file.
" * Matching targets
"  (jumping nicely, but only inside []).
nnoremap ]b :call searchpair('\[','','\]')<cr>
nnoremap [b :call searchpair('\[','','\]','b')<cr>
" * Horizontal (special horizontal mode: press z to turn on/off).
nnoremap <silent> zh :call HorizontalScrollMode('h')<CR>
nnoremap <silent> zl :call HorizontalScrollMode('l')<CR>
nnoremap <silent> zH :call HorizontalScrollMode('H')<CR>
nnoremap <silent> zL :call HorizontalScrollMode('L')<CR>

function! HorizontalScrollMode( call_char )
    if &wrap
        return
    endif

    echohl Title
    let typed_char = a:call_char
    while index( [ 'h', 'l', 'H', 'L' ], typed_char ) != -1
        execute 'normal! z'.typed_char
        redraws
        echon '-- Horizontal scrolling mode (h/l/H/L)'
        let typed_char = nr2char(getchar())
    endwhile
    echohl None | echo '' | redraws
endfunction

" * Vertical.
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" * Windows.
set splitright
let g:tinykeymap#mapleader=','
let g:tinykeymap#map#windows#map='<c-w>'

" /home/dubuntus/.vim/plugged/tinykeymap_vim/autoload/tinykeymap/map/windows.vim
call tinykeymap#Load('windows')

"if has('autocmd')
	"" change colorscheme depending on current buffer
	"" if desired, you may set a user-default colorscheme before this point,
	"" otherwise we'll use the Vim default.
	"" Variables used:
		"" g:colors_name : current colorscheme at any moment
		"" b:colors_name (if any): colorscheme to be used for the current buffer
		"" s:colors_name : default colorscheme, to be used where b:colors_name hasn't been set
	"if has('user_commands')
		"" User commands defined:
			"" ColorScheme <name>
				"" set the colorscheme for the current buffer
			"" ColorDefault <name>
				"" change the default colorscheme
		"command -nargs=1 -bar ColorScheme
			"\ colorscheme <args>
			"\ | let b:colors_name = g:colors_name
		"command -nargs=1 -bar ColorDefault
			"\ let s:colors_name = <q-args>
			"\ | if !exists('b:colors_name')
				"\ | colors <args>
			"\ | endif
	"endif
	"if !exists('g:colors_name')
		"let g:colors_name = 'default'
	"endif
	"let s:colors_name = g:colors_name
	"au BufEnter *
		"\ let s:new_colors = (exists('b:colors_name')?(b:colors_name):(s:colors_name))
		"\ | if s:new_colors != g:colors_name
			"\ | exe 'colors' s:new_colors
		"\ | endif
"endif

" Personal settings.
" * Folding.
" - Characters shown on the right of the fold.
" Middle dot 0119·
set fillchars+=fold:\ 
set foldtext=CustomFoldText()

setlocal foldmethod=expr

setlocal foldexpr=GetPotionFold(v:lnum)
function! GetPotionFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif
  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif
endfunction
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction
function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1
  while current <= numlines
      if getline(current) =~? '\v\S'
          return current
      endif
      let current += 1
  endwhile
  return -2
endfunction
function! CustomFoldText()
  " get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  " Width of a viewport.
  "let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let minimalColorColumn = split(&cc, ',')[0]
  let w = minimalColorColumn - 1

  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeFormatted = "    " . foldSize . "ℓ"

  let foldLevelFormatted = repeat(" ~>", v:foldlevel)
  let expansionString = repeat(" ", w -
    \ strwidth(foldSizeFormatted.line.foldLevelFormatted))

  return line . expansionString . foldSizeFormatted . foldLevelFormatted
endfunction
set foldcolumn=3
augroup Folding
  autocmd!
  autocmd BufReadPre * setlocal foldmethod=indent
  autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

augroup Markdown
  " Clear all autocommands that were set before that.
  autocmd!
  "autocmd BufNewFile,BufReadPost *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md
   "autocmd Filetype markdown set filetype=markdown
  let g:vim_markdown_fenced_languages = [
    \'css',
    \'sass',
    \
    \'javascript',
    \'js=javascript',
    \'json=javascript',
    \
    \'python',
    \'py=python',
    \
    \'xml',
    \'html'
  \]
  " - Folding
  let g:vim_markdown_folding_level=3

  " - Enabling conceal for ~~strikethroughText~~
  let g:vim_markdown_strikethrough = 1

  " - Disabling autoindentation on `o`.
  let g:vim_markdown_new_list_item_indent = 0

  " - Autofit table of contents.
  let g:vim_markdown_toc_autofit = 1

  " - Enalbe follow the anchors (links) inside file.
  let g:vim_markdown_follow_anchor = 1

  " - Concealing things like **bold**.
  autocmd FileType markdown setlocal conceallevel=2 
augroup END

augroup Python
  " Clear all autocommands that were set before that.
  autocmd!
  " - Sets.
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
  " - Run.
  autocmd FileType python nnoremap <buffer> <localleader><cr> :!python %<cr>
augroup END

augroup Vim
  " Clear all autocommands that were set before that.
  autocmd!
  "" - Add plugin by formating and surrounding string from github.
  autocmd BufNewFile,BufRead init.vim nmap <localleader>p "*pJJxhXysiW-
    \Plug '<cr>'<cr>>>
augroup END

" * Formatting.
augroup Comments
  autocmd!
  " * Disable auto comment insert on O.
  autocmd BufNewFile,BufRead * setlocal formatoptions-=o
augroup END

" * Highlight on yank.
augroup HighlightYankedText
    autocmd!
    autocmd TextYankPost *  silent! lua require'vim.highlight'.on_yank()
augroup END

" * Preserve last cursor position after revisiting a file.
if has("autocmd")
  autocmd!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"  My abbreviations.
iabbrev @@ sasha.pakalo@gmail.com

" Visuals.
"Use 24-bit (true-color) mode in Vim/Neovim.
if (has("termguicolors"))
  set termguicolors
endif

" * Highlight range of an exmode command.
lua << EOF
local range_highlight = require("range-highlight")
  range_highlight.setup {
    highlight = "Visual",
    highlight_with_out_range = {
      d = true,
      delete = true,
      m = true,
      move = true,
      y = true,
      yank = true,
      c = true,
      change = true,
      j = true,
      join = true,
      ["<"] = true,
      [">"] = true,
      s = true,
      subsititue = true,
      sno = true,
      snomagic = true,
      sm = true,
      smagic = true,
      ret = true,
      retab = true,
      t = true,
      co = true,
      copy = true,
      ce = true,
      center = true,
      ri = true,
      right = true,
      le = true,
      left = true,
      sor = true,
      sort = true
	}
}
EOF
" * Workspace.
lua << EOF
  local true_zen = require("true-zen")

  true_zen.setup {
    ui = {
      bottom = {
        laststatus = 0,
        ruler = false,
        showmode = false,
        showcmd = false,
        cmdheight = 1,
      },

      top = {
        showtabline = 0,
      },

      left = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
      },
    },

    modes = {
      ataraxis = {
        left_padding = 32,
        right_padding = 32,
        top_padding = 1,
        bottom_padding = 1,
        ideal_writing_area_width = {0},
        auto_padding = true,
        keep_default_fold_fillchars = true,
        custom_bg = {"none", ""},
        bg_configuration = true,
        quit = "untoggle",
        ignore_floating_windows = true,

        affected_higroups = {
          NonText = true,
          FoldColumn = true,
          ColorColumn = true,
          VertSplit = true,
          StatusLine = true,
          StatusLineNC = true,
          SignColumn = true,
        },
      },

      focus = {
        margin_of_error = 5,
        focus_method = "experimental"
      },
    },

    integrations = {
      vim_gitgutter = false,
      galaxyline = false,
      tmux = false,
      gitsigns = false,
      nvim_bufferline = false,
      twilight = true,
      vim_airline = false,
      vim_powerline = false,
      vim_signify = false,
      express_line = false,
      lualine = false,
      lightline = false,
      feline = false
    },

    misc = {
      on_off_commands = false,
      ui_elements_commands = false,
      cursor_by_mode = false,
    }
  }
EOF

lua << EOF
  require("twilight").setup {
    dimming = {
      alpha = 0.25, -- amount of dimming
      -- we try to get the foreground from the highlight groups or fallback color
      color = { "Normal", "#ffffff" },
      inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
    },
    context = 10, -- amount of lines we will try to show around the current line
    treesitter = true, -- use treesitter when available for the filetype
    -- treesitter is used to automatically expand the visible text,
    -- but you can further control the types of nodes that should always be fully expanded
    expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {}, -- exclude these filetypes
  }
EOF

" # Theme.
" * Settings.
syntax enable
set background=light
" * Keybinds
" - Lookup table of set colors.
nnoremap <leader>,t :so $VIMRUNTIME/syntax/hitest.vim<cr>
nnoremap <leader>,c :hi<cr>

colorscheme gruvbox-material
highlight Pmenu ctermbg=240 gui=bold
" CursorLineNr doesn't work without it.
set cursorline
highlight LineNr ctermfg=248 guifg=#bbbbbb
highlight CursorLineNr ctermfg=137
highlight Statement ctermfg=186
" * Contrasting.
" - 1. Declarations.
highlight Identifier cterm=bold ctermfg=32
highlight Comment gui=italicbold guifg=#5555aa
" * Inconspicious.
highlight Whitespace guifg=#cccccc
"highlight SpecialKey guifg=#555555

" - Helpers for creating a theme.
lua << EOF
  local Color, colors, Group, groups, styles = require('colorbuddy').setup()

  -- Use Color.new(<name>, <#rrggbb>) to create new colors
  -- They can be accessed through colors.<name>
  Color.new('background',  '#282c34')
  Color.new('red',         '#cc6666')
  Color.new('green',       '#99cc99')
  Color.new('yellow',      '#f0c674')

  Group.new('FoldColumn', colors.yellow, colors.yellow)
-- hi FoldColumn guibg=test guifg=Black

  -- Define highlights in terms of `colors` and `groups`
  -- Group.new('Function'        , colors.yellow      , colors.background , styles.bold)
  --  Group.new('luaFunctionCall' , groups.Function    , groups.Function   , groups.Function)

  -- Define highlights in relative terms of other colors
  --  Group.new('Error'           , colors.red:light() , nil               , styles.bold)
EOF

" Highlight colors.
lua <<EOF
  -- Attaches to every FileType mode
  require 'colorizer'.setup()

  -- Attach to certain Filetypes, add special configuration for `html`
  -- Use `background` for everything else.
  -- require 'colorizer'.setup {
  --   'css';
  --   'javascript';
  --   html = {
  --     mode = 'foreground';
  --   }
  -- }

  -- Use the `default_options` as the second parameter, which uses
  -- `foreground` for every mode. This is the inverse of the previous
  -- setup configuration.
  -- require 'colorizer'.setup({
  --   'css';
  --   'javascript';
  --   html = { mode = 'background' };
  -- }, { mode = 'foreground' })

  -- Use the `default_options` as the second parameter, which uses
  -- `foreground` for every mode. This is the inverse of the previous
  -- setup configuration.
  -- require 'colorizer'.setup {
  --   '*'; -- Highlight all files, but customize some others.
  --   css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  --   html = { names = false; } -- Disable parsing "names" like Blue or Gray
  -- }

  -- Exclude some filetypes from highlighting by using `!`
  -- require 'colorizer'.setup {
  --   '*'; -- Highlight all files, but customize some others.
  --   '!vim'; -- Exclude vim from highlighting.
  --   -- Exclusion Only makes sense if '*' is specified!
  -- }
EOF

" # Indents.
lua <<EOF
vim.opt.termguicolors = true
-- Enabling special characters.
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- Declaring colors.
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- Use treesitter to calculate indentation when possible.

require("indent_blankline").setup {
  -- Char to be used to display an indent.
  char = "|",
  -- Exclude certain buffer types.
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'dashboard' },

  show_end_of_line = true,
  space_char_blankline = " ",
  -- Use Treesitter to calculate indentation when possible.
  indent_blankline_use_treesitter = true,
  -- Enable context highlight by Treesitter.
  show_current_context = true,
  show_current_context_start = true,

  -- Assigning colors.
  char_highlight_list = {
    'IndentBlanklineIndent1',
    'IndentBlanklineIndent2',
    'IndentBlanklineIndent3',
    'IndentBlanklineIndent4',
    'IndentBlanklineIndent5',
    'IndentBlanklineIndent6',
  },
}
EOF

" # Rnvimr.
" Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
" - Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 60

" Color columns indicating width.
"   1 + 2 splits (should be textwidth), 2 splits, 2 + 1 splits, full width - right sidebar, full width.
set colorcolumn=80,115,151,203,235

" # Markdown.
" Use signs to highlight code blocks.
function! ColorCodeBlocks() abort " {{{1
  setlocal signcolumn=no

  sign define codeblock linehl=codeBlockBackground

  augroup code_block_background
    autocmd! * <buffer>
    autocmd InsertLeave  <buffer> call s:place_signs()
    autocmd BufEnter     <buffer> call s:place_signs()
    autocmd BufWritePost <buffer> call s:place_signs()
  augroup END
endfunction

function! s:place_signs()
  let l:continue = 0
  let l:file = expand('%')

  execute 'sign unplace * file=' . l:file

  for l:lnum in range(1, line('$'))
    let l:line = getline(l:lnum)
    if l:continue || l:line =~# '^\s*```'
      execute printf('sign place %d line=%d name=codeblock file=%s',
            \ l:lnum, l:lnum, l:file)
    endif

    let l:continue = l:continue
          \ ? l:line !~# '^\s*```$'
          \ : l:line =~# '^\s*```'
  endfor
endfunction

setl signcolumn=no

hi markdownCodeBlockBG ctermbg=137
sign define codeblock linehl=markdownCodeBlockBG

function! MarkdownBlocks()
  let l:continue = 0
  execute "sign unplace * file=".expand("%")

  " iterate through each line in the buffer
  for l:lnum in range(1, len(getline(1, "$")))
    " detect the start fo a code block
    if getline(l:lnum) =~ "^```.*$" || l:continue
      " continue placing signs, until the block stops
      let l:continue = 1
      " place sign
      execute "sign place ".l:lnum." line=".l:lnum." name=codeblock file=".expand("%")
      " stop placing signs
      if getline(l:lnum) =~ "^```$"
        let l:continue = 0
      endif
    endif
  endfor
endfunction

" Use signs to highlight code blocks
" Set signs on loading the file, leaving insert mode, and after writing it
au InsertLeave *.md call MarkdownBlocks()
au BufEnter *.md call MarkdownBlocks()
au BufWritePost *.md call MarkdownBlocks()
