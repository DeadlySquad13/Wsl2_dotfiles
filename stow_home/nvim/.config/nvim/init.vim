set nocompatible
" General.
" Bash doesn’t load your .bashrc unless it’s interactive.
set shellcmdflag=-ic

" - Enable settings for specific filetypes.
filetype plugin on
set encoding=utf-8

" - Delay before showing message in ms (which-key).
set timeoutlen=500

" Don't parse long lines for syntax highlight.
set synmaxcol=256
syntax sync minlines=256

" Support for embedded scripts (for example, lua in init.vim)
" - Syntax highlighting.
let g:vimsyn_embed='l'
" - Folding. a: augroups, f - functions.
"let g:vimsyn_folding='af'

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

" - Minimal configuration:
"set autoindent
"set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=2  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character

" - Good to have for consistency.
set tabstop=2   " Number of spaces that a <Tab> in the file counts for
set softtabstop=2
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth

"syntax on
"filetype plugin indent on

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
  Plug 'folke/which-key.nvim'
  " * Integration.
  " - With system.
  Plug 'majkinetor/vim-omnipresence'
  " - With browser.
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
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

  " LSP.
  Plug 'neovim/nvim-lspconfig'

  " * Snippets.
  Plug 'SirVer/ultisnips'
  " - Collections of snippets.
  Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim'

  " * Autocomplete
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  " for ultisnips users.
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  " - Python formatter.
  Plug 'tell-k/vim-autopep8'

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
  Plug 'windwp/nvim-autopairs'

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
  " Plug 'plasticboy/vim-markdown'
  Plug 'SidOfc/mkdx'
  " * Preview.
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
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

" General keybindings.
let mapleader=' '
let maplocalleader='\'

" Integration with system.
let g:omnipresence_hotkey = 'f11'

" Search for item under cursor in vim docs (:help).
" - 'investigate help'
noremap <leader>gih K

" - Search for tags.
nnoremap <leader>st :%s;<\w*>\(<\\\w*>\)\?;;g<left><left>

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

lua << EOF
  require('config.dashboard')
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
let g:autopep8_disable_show_diff=1

" Use omni completion provided by lsp.
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Ultisnips.
"let g:UltiSnipsExpandTrigger = '<c-g>'
let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'             
let g:UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'  
let g:UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
let g:UltiSnipsListSnippets = '<c-x><c-s>'                            
let g:UltiSnipsRemoveSelectModeMappings = 0 
" - Optimizing `provider#python3#Call()` by hardcoding python path (which
"   python).
let g:loaded_python_provider = 1
let g:python_host_skip_check = 1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check = 1
let g:python3_host_prog = '/usr/bin/python'

lua <<EOF
  -- Setup nvim-cmp.
  -- config = function()      
  --     vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
  --     vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
  --     vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
  --     vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
  --     vim.g.UltiSnipsRemoveSelectModeMappings = 0
  -- end

  -- config()

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local ultisnips_engine = {
    can_jump = function()
      return vim.fn["UltiSnips#CanJumpForwards"]() == 1
    end,

    jump = function()
      return vim.api.nvim_feedkeys(
        t("<Plug>(ultisnips_jump_forward)"), 'm', true
      )
    end,

    can_jump_backwards = function()
      return vim.fn["UltiSnips#CanJumpBackwards"]() == 1
    end,

    jump_backward = function()
      return vim.api.nvim_feedkeys(
        t("<Plug>(ultisnips_jump_backward)"), 'm', true
      )
    end,

    can_expand = function()
      return vim.fn["UltiSnips#CanExpandSnippet"]() == 1
    end,

    expand = function()
      -- Maybe replace with #Anon?
      print('expand!')
      return vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"))
      -- return vim.fn.feedkeys(t("<C-R>=UltiSnips#Anon()<CR>"))
    end,
  }

  local snippets_engine = ultisnips_engine;

  local cmp = require('cmp')
  -- Optional.
  -- local cmp_nvim_ultisnips = require('cmp_nvim_ultisnips').setup {}
  local cmp_ultisnips_mappings = require('cmp_nvim_ultisnips.mappings')

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,

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
              -- If you haven't started browsing snippets yet, choose next (first).
              -- if not cmp.get_active_entry() then
              --   return cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              -- end
              if snippets_engine.can_expand() then
                return snippets_engine.expand()
              end


              return cmp.confirm({ select = true })
            end

            return fallback()
          end,

          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end
      }),

      -- Just defining function doesn't work.
      ['<c-j>'] = cmp.mapping(
        function(fallback)
          if snippets_engine.can_jump() then
            return snippets_engine.jump()
          end
          
          return fallback()
        end,
        {'i', 'c', 's'}
      ),

      -- Just defining function doesn't work.
      ['<c-k>'] = cmp.mapping(
        function(fallback)
          if snippets_engine.can_jump_backwards() then
            return snippets_engine.jump_backward()
          end
          
          return fallback()
        end,
        {'i', 'c', 's'}
      ),

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
    },
  }

  -- * Enabling support for autopairs.
  -- * If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


  -- ? Is it used only for lisp?.
  -- * Add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure",
  --"clojurescript", "fennel", "janet" }
  cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

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
  local lspconfig = require('lspconfig')
  local configs = require('lspconfig.configs')

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Environment variables.
  local ENV = (function ()
    local env = {
      HOME = vim.fn.getenv 'HOME',
    }

    -- PATH environment variable defined specifically for vim.
    function env.PATH(self)
      return {
        npm_global_modules = self.HOME .. '/.npm-global/lib/node_modules',
        npm_global_bin = self.HOME .. '/.npm-global/bin',
      }
    end

    return env;
  end)()
  
  -- local servers = { 'pylsp', 'tsserver', 'vimls' }

  -- for _, lsp in ipairs(servers) do
  --   lspconfig[lsp].setup {
  --     on_attach = on_attach,
  --     capabilities = capabilities,
  --   }
  -- end

  -- * Python.
  lspconfig.pylsp.setup {
    capabilities = capabilities
  }

  -- * Typescript.
  lspconfig.tsserver.setup {
    -- Default values.
    cmd = { ENV:PATH().npm_global_bin .. '/typescript-language-server', "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),

    capabilities = capabilities,
  }

  -- * Vim.
  lspconfig.vimls.setup {
    cmd = { ENV:PATH().npm_global_modules .. '/vim-language-server/bin/index.js', '--stdio' },

    capabilities = capabilities,

    filetypes = { "vim" },
    init_options = {
      diagnostic = {
        enable = true
      },
      -- If you want to speed up index, change gap to smaller and count to
      -- greater, this will cause high CPU usage for some time.
      indexes = {
        -- Count of files index at the same time.
        count = 3,
        -- Index time gap between next file.
        gap = 100,
        projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
        -- Index vim's runtimepath files.
        runtimepath = true
      },
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
        fromRuntimepath = true,
        fromVimruntime = true
      },
      vimruntime = ""
    },
  }

  -- * Emmet.
  --if not configs.ls_emmet then
  --  configs.ls_emmet = {
  --    default_config = {
  --      cmd = { 'ls_emmet', '--stdio' };
  --      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
  --        'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
  --      root_dir = function(fname)
  --        return vim.loop.cwd()
  --      end;
  --      settings = {};
  --    };
  --  }
  --end

  --lspconfig.ls_emmet.setup{ capabilities = capabilities }
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
  require('config.treesitter')
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

" * Surround.
"  HELP: *surround-customizing*, *curly-braces-names*
" - visually select what you want to wrap and then press S- to tigger
"   the - surrounding. It will then prompt you for a 'start' and 'ending' text.
let g:surround_{char2nr('-')} = "\1start: \1\r\2end: \2"
" - **L**ua anonymous function.
let g:surround_{char2nr('la')} = "function() \r end"

" * Create a new line above the current one without exiting normal mode.
map <Leader>O mtO<Esc>`t

" * Create a new line below the current one without exiting normal mode.
map <Leader>o mto<Esc>`t

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

"function! HorizontalScrollMode( call_char )
    "if &wrap
        "return
    "endif

    "echohl Title
    "let typed_char = a:call_char
    "while index( [ 'h', 'l', 'H', 'L' ], typed_char ) != -1
        "execute 'normal! z'.typed_char
        "redraws
        "echon '-- Horizontal scrolling mode (h/l/H/L)'
        "let typed_char = nr2char(getchar())
    "endwhile
    "echohl None | echo '' | redraws
"endfunction

" * Vertical.
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" Brackets autopairs.
lua << EOF
  require('config.nvim_autopairs')
EOF

" * Windows.
set splitright

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

" - Fold settings.
set foldcolumn=3

set foldlevelstart=2
set foldnestmax=3

augroup Folding
  autocmd!
  autocmd BufReadPre * setlocal foldmethod=expr
  "autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
  " Open all folds under cursor.
  " autocmd BufWinEnter * silent normal! zO
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

augroup Graphviz
  " Clear all autocommands that were set before that.
  autocmd!
  " - Swap relationships.
  autocmd FileType dot nnoremap <buffer> <localleader>sr ^"yct-<esc>2W"yP"yD^X"yPa<space><esc>
  " - Run: create png from name of the current file and open it.
  autocmd FileType dot nnoremap <buffer> <localleader><cr> :! dotPng %:r<cr>
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

" Abbreviations.
" # **P**ersons abbreviations (nicknames, names).
iabbrev @@ sasha.pakalo@gmail.com
" * Personal (**me**).
" - 13 for nickname.
iabbrev pme13 DeadlySquad13
" - Re for real.
iabbrev pmeRe Pakalo Alexander

" # Ex-mode.
" Edit file in current directory.
cabbr %% <c-r>=expand('%:p:h')<cr>

" - exec normal.
cabbr exn exec "normal"<left>

" Visuals.
"Use 24-bit (true-color) mode in Vim/Neovim.
if (has("termguicolors"))
  set termguicolors
endif

" * Highlight range of an exmode command.
lua << EOF
  require('config.range_highlight')
EOF

" * Workspace.
lua << EOF
  require('config.true_zen')
  require('config.twilight')
EOF

" Navigation.
" # Across files.
" * Rnvimr.
" - Make Ranger replace netrw and be the file explorer.
let g:rnvimr_ex_enable = 1
" * Rel.
" - Jump to link (have to define here too because which_key doesn't handle
"   conflicts occured by <unique> mapping of a Rel.vim).
nnoremap <leader>gl <Plug>(Rel)

" # Inside file.
" * Matching targets
"  (jumping nicely, but only inside []).
nnoremap ]b :call searchpair('\[','','\]')<cr>
nnoremap [b :call searchpair('\[','','\]','b')<cr>

" * Show group highlights of the item under the cursor.
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Mappings.
lua << EOF
  -- # Tinykeymap transitive mappings.
  require('config.tinykeymap')
  -- # Which-key.
  require('config.mappings')
EOF

" # Theme.
" * Settings.
syntax enable
set background=light

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

lua << EOF
  -- - Helpers for creating a theme.
  require('config.theme')
  -- # Highlight colors.
  require('config.colorizer')
  -- # Indents.
  require('config.indent_blankline')
EOF

" * Rnvimr.
" - Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
" - Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 60

" * NERDTree.
" - Start NERDTree automatically. If a file is specified, move the cursor to
" its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" - Place on the right.
let g:NERDTreeWinPos = "right"


" Color columns indicating width.
"   1 + 2 splits (should be textwidth), 2 splits, 2 + 1 splits, full width - right sidebar, full width.
set colorcolumn=80,115,151,203,235

" # Markdown.
" Use signs to highlight code blocks.
"function! ColorCodeBlocks() abort " {{{1
  "setlocal signcolumn=no

  "sign define codeblock linehl=codeBlockBackground

  "augroup code_block_background
    "autocmd! * <buffer>
    "autocmd InsertLeave  <buffer> call s:place_signs()
    "autocmd BufEnter     <buffer> call s:place_signs()
    "autocmd BufWritePost <buffer> call s:place_signs()
  "augroup END
"endfunction

"function! s:place_signs()
  "let l:continue = 0
  "let l:file = expand('%')

  "execute 'sign unplace * file=' . l:file

  "for l:lnum in range(1, line('$'))
    "let l:line = getline(l:lnum)
    "if l:continue || l:line =~# '^\s*```'
      "execute printf('sign place %d line=%d name=codeblock file=%s',
            "\ l:lnum, l:lnum, l:file)
    "endif

    "let l:continue = l:continue
          "\ ? l:line !~# '^\s*```$'
          "\ : l:line =~# '^\s*```'
  "endfor
"endfunction

"setl signcolumn=no

"hi markdownCodeBlockBG ctermbg=137
"sign define codeblock linehl=markdownCodeBlockBG

"function! MarkdownBlocks()
  "let l:continue = 0
  "execute "sign unplace * file=".expand("%")

  "" iterate through each line in the buffer
  "for l:lnum in range(1, len(getline(1, "$")))
    "" detect the start fo a code block
    "if getline(l:lnum) =~ "^```.*$" || l:continue
      "" continue placing signs, until the block stops
      "let l:continue = 1
      "" place sign
      "execute "sign place ".l:lnum." line=".l:lnum." name=codeblock file=".expand("%")
      "" stop placing signs
      "if getline(l:lnum) =~ "^```$"
        "let l:continue = 0
      "endif
    "endif
  "endfor
"endfunction

"" Use signs to highlight code blocks
"" Set signs on loading the file, leaving insert mode, and after writing it
"au InsertLeave *.md call MarkdownBlocks()
"au BufEnter *.md call MarkdownBlocks()
"au BufWritePost *.md call MarkdownBlocks()

runtime syntax/general/comments.vim

