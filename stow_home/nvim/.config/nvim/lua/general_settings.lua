local ENV = require('global')
local set = vim.opt

---@see [Managing vim options section in "Getting started using Lua in
--Nvim"](https://github.com/nanotee/nvim-lua-guide#managing-vim-options)

-- Is your environment fast enough to handle frequent redraws?
---@see `:h slow-terminal`.
local IS_ENVIRONMENT_FAST = false

-- Bash doesn’t load your .bashrc unless it’s interactive.
set.shellcmdflag:append('i')

-- Support for embedded scripts (for example, lua in init.vim)
-- - Syntax highlighting.
vim.g.vimsyn_embed = 'l'

-- Motions that are allowed to cross line boundaries.
--   Go the end of the previous line / start of the next line easier.
set.whichwrap:append('hl')

local buffer_local_settings = {
  -- * Languages.
  spell = true,
  -- - Language dictionaries.
  spelllang = { 'en_us', 'ru_ru' },
}

local global_local = {
  syntax = 'on',
  -- * Search.
  -- - Making search case insensitive. Add \c to the command to make it sensitive.
  ignorecase = true,
  -- - If a pattern contains an uppercase letter, it is case sensitive,
  --   otherwise, it's not. Should be with ignorecase.
  smartcase = true,
  encoding = 'utf-8',

  -- - Delay before showing message in ms (which-key).
  timeoutlen = 500,

  -- - Folding. a: augroups, f - functions.
  --let g:vimsyn_folding='af'

  -- * Languages.
  -- - Behave like smartcase when adding word to dictionary.
  spellcapcheck = '',
  -- - Think of camelCased words as separate words (camel and Cased will be parsed).
  spelloptions = 'camel',

  -- Insert only one space after joining lines ending with '.', '?'...
  joinspaces = false,

  -- Gutter.
  relativenumber = true,

  -- Number of lines visible before edge of viewport.
  scrolloff = 5,
  sidescrolloff = 3,
  scrolljump = 8,

  --filetype plugin indent on

  fileformat = 'unix',

  -- - Persistant undo.
  undofile = true,
  undodir = ENV.NVIM_DATA .. '/undo/',

  -- - Persistant buffers.
  hidden = true,

  -- - Try to reuse windows / tabs when switching buffers.
  switchbuf = 'usetab',

  -- Give freedom to visual mod by allowing it to travel when there's no text.
  virtualedit = 'block',
  -- * Visuals.
  -- Use 24-bit (true-color) mode in Vim/Neovim.
  termguicolors = true,

  -- Supplementary data persistance.
  backup = false,
  writebackup = false,
  swapfile = false,
  directory = ENV.NVIM_DATA .. '/swag/',
  backupdir = ENV.NVIM_DATA .. '/backup/',
  viewdir = ENV.NVIM_DATA .. '/view/',
  spellfile = ENV.NVIM_DATA .. '/spell/en.uft-8.add',
  history = 2000,

  --mouse          = "nv",
  --errorbells     = true,
  --visualbell     = true,
  --hidden         = true,
  --fileformats    = "unix,mac,dos",
  --magic          = true,
  --virtualedit    = "block",
  --encoding       = "utf-8",
  --viewoptions    = "folds,cursor,curdir,slash,unix",
  --sessionoptions = "blank,buffers,curdir,folds,localoptions,options,help,tabpages,winsize",
  sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize',
  --clipboard      = "unnamedplus",
  --wildignorecase = true,
  --wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",

  shada = "!,'300,<50,@100,s10,h",
  --backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
  --smarttab       = true,
  --shiftround     = true,
  --timeout        = true,
  --ttimeout       = true,
  --timeoutlen     = 500,
  --ttimeoutlen    = 10,
  --updatetime     = 100,
  lazyredraw = not IS_ENVIRONMENT_FAST,
  --redrawtime     = 1500,
  --ignorecase     = true,
  --smartcase      = true,
  --infercase      = true,
  --incsearch      = true,
  --wrapscan       = true,
  --complete       = ".,w,b,k",
  --inccommand     = "nosplit",
  --grepformat     = "%f:%l:%c:%m",
  grepprg = 'rg --hidden --vimgrep --smart-case --',
  --breakat        = [[\ \	,:,!?]];
  --startofline    = false,
  --whichwrap      = "h,l,<,>,[,],",
  --splitbelow     = true,
  splitright = true, -- Split window to right.
  --switchbuf      = "useopen",
  --backspace      = "indent,eol,start",
  --diffopt        = "filler,iwhite,internal,algorithm:patience",
  --completeopt    = "menuone,noselect",
  --jumpoptions    = "stack",
  --showmode       = false,
  --shortmess      = "aoOTIcF",
  --scrolloff      = 2,
  --sidescrolloff  = 5,
  ruler = IS_ENVIRONMENT_FAST,
  --showtabline    = 2,
  --winwidth       = 30,
  --winminwidth    = 10,
  --helpheight     = 12,
  --previewheight  = 12,
  --showcmd        = false,
  --cmdheight      = 2,
  --cmdwinheight   = 5,
  --equalalways    = false,
  laststatus = 0, -- Better to use 0 with tpipeline.
  fillchars = 'fold: ',
  --display        = "lastline",
  showbreak = '↳  ', -- ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS (U+2937, UTF-8: E2 A4 B7)
  -- (tab: simple dash + Electric Arrow (U+2301))
  list = true, -- Show special characters.
  listchars = {
    eol = '↴',
    nbsp = '⦸',
    space = '⋅',
    tab = '-⌁',
    trail = '-',
    extends = '→',
    precedes = '←',
  },
  pumheight = 20,
  pumblend = 10, -- Transparency of the popup menu (for autocompletion).
  --winblend       = 10,

  -- Program that will be used when asking for help by pressing K.
  keywordprg = ':help',

  -- Program that will be used when issuing `:!`.
  shell = '/bin/bash', -- Unfortunately, I have two errors (`job` and `ioctl`) when running with bash.
}

local indentation = {
  -- # Indentation.
  --autoindent
  --smartindent   -- Do smart autoindenting when starting a new line
  shiftwidth = 2, -- Set number of spaces per auto indentation
  expandtab = true, -- When using <Tab>, put spaces instead of a <tab> character

  -- - Good to have for consistency.
  tabstop = 2, -- Number of spaces that a <Tab> in the file counts for.
  softtabstop = -1, --  Number of spaces that a <Tab> in the file counts for while editing. Use number of shiftwidth.
  smarttab = true, -- At <Tab> at beginning line inserts spaces set in shiftwidth.
}

local bw_local = {
  --synmaxcol      = 2500;
  --formatoptions  = "1jcroql";
  textwidth = 79,
  autoindent = true,

  breakindentopt = 'shift:2,min:20',

  -- To much hassle with ing nice wrapping, too much inconsistencies across
  --   different environments. Just format text yourself and make people on
  --   github happier.
  -- In case someone sends you unformatted text, format it or use horizontal
  --   commands.
  wrap = false,
  linebreak = true,
  number = true,
  --colorcolumn    = "80";
  foldenable = true,
  signcolumn = 'yes',
  conceallevel = 2,
  concealcursor = 'niv',
  cursorline = IS_ENVIRONMENT_FAST,
}

local set_settings = require('utils.setters').set_settings

set_settings(
  vim.tbl_extend(
    'error',
    buffer_local_settings,
    global_local,
    bw_local,
    indentation
  )
)
