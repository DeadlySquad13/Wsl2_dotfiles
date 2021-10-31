set nocompatible
" General.
" - Enable settings for specific filetypes.
filetype plugin on
set encoding=utf-8

" Don't parse long lines for syntax highlight.
set synmaxcol=128
syntax sync minlines=256

set number relativenumber
set noswapfile
set scrolloff=5

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

" Plugins.
call plug#begin('~/.vim/plugged')
  " General.
  Plug 'tpope/vim-repeat'
  Plug 'tomtom/tinykeymap_vim'

   "- Starting page.
  "Plug 'mhinz/vim-startify'
  Plug 'glepnir/dashboard-nvim'

  " - Sessions.
  "Plug 'rmagatti/auto-session'

  " - Session management.
  "Plug 'rmagatti/session-lens'

  " - Russian layout.
  Plug 'powerman/vim-plugin-ruscmd'

  " * Coding.
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'gennaro-tedesco/nvim-peekup'

  " - Targets.
  Plug 'wellle/targets.vim'

  " - Motion.
  Plug 'tjdevries/train.nvim'
  Plug 'ggandor/lightspeed.nvim'

  " # Navigation.
  " * Inside file.
  " * Across files.
  Plug 'kevinhwang91/rnvimr'
  Plug 'preservim/nerdtree'


  " * Telescope deps.
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

  " - Jumping to file under cursor.
  Plug 'aklt/rel.vim'

  " Visuals.
  " * Status line.
  Plug 'vim-airline/vim-airline'
  " * Theme.
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'vim-airline/vim-airline-themes'
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

"source 'plug-config.vim'
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

" * Autocomplete.
" Doesn't work...
"inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
"inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
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
" * Matching braces.
packadd! matchit

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
nnoremap <a-j> J

" * Search and replace:
" - Current word under cursor.
nnoremap <leader>s :%s;\<<c-r><c-w>\>;;g<left><left>

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
nmap <c-r><c-\> :RnvimrToggle<cr>
" * NERDTree.
" TODO: Move to window mode.
"nnoremap <c-w><c-\> :NERDTreeToggle<cr> <bar> =
"nnoremap <c-w>\ :NERDTreeFocus<cr> <bar> <c-w>=
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
"call tinykeymap#EnterMap('windowsMode', '<C-w>', {'name': 'Windows mode'})
let g:tinykeymap#map#windows#map='<c-w>'

call tinykeymap#Load('windows')

"augroup Tinykeymap
  "autocmd!
  "call tinykeymap#Load('windows')
  """ - Resize.
  "call tinykeymap#Map('windows', '>', '5wincmd >')
  "call tinykeymap#Map('windows', '<', '5wincmd <')
  "call tinykeymap#Map('windows', '+', '5wincmd +')
  "call tinykeymap#Map('windows', '-', '5wincmd -')

  """ - Move.
  """call tinykeymap#Map('windows', 'l', 'wincmd l')
  """call tinykeymap#Map('windows', 'h', 'wincmd h')
  """call tinykeymap#Map('windows', 'j', 'wincmd j')
  """call tinykeymap#Map('windows', 'k', 'wincmd k')
  """call tinykeymap#Map('windows', 'q', 'wincmd q')
  "call tinykeymap#Map('windows', '\', 'NERDTreeToggle')
  "call tinykeymap#Map('windows', '<c-\>', 'NERDTreeFocus')
"augroup END

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
augroup Folding
  autocmd!
  au BufReadPre * setlocal foldmethod=syntax
  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
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

augroup Markdown
  " Clear all autocommands that were set before that.
  autocmd!
  " - Sets.
  autocmd FileType markdown highlight Normal ctermbg=21
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

" # Indents.
lua <<EOF
vim.opt.termguicolors = true
-- Enabling special characters.
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
-- Context indent highlighted by treesitter.
-- Colors.
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- Use treesitter to calculate indentation when possible.

require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
  indent_blankline_use_treesitter = true,
  show_current_context = true,

  -- Colors.
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
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
