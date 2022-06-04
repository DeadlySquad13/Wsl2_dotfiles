local ENV = require('global');
local set = vim.opt;

local global = {
  cache_dir = ENV.HOME .. '/.cache/nvim/'
}

local function bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      vim.cmd('set ' .. k)
    else
      vim.cmd('set ' .. k .. '=' .. v)
    end
  end
end

-- Bash doesn’t load your .bashrc unless it’s interactive.
set.shellcmdflag:append('ic');

-- Support for embedded scripts (for example, lua in init.vim)
-- - Syntax highlighting.
vim.g.vimsyn_embed = 'l';

-- Motions that are allowed to cross line boundaries.
--   Go the end of the previous line / start of the next line easier.
set.whichwrap:append('hl');

local function load_options()
  local global_local = {
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

    -- Behave like smartcase when adding word to dictionary.
    spellcapcheck = '',
    -- Think of camelCased words as separate words (camel and Cased will be parsed). 
    spelloptions = 'camel',

    -- Insert only one space after joining lines ending with '.', '?'...
    joinspaces = false,

    -- Gutter.
    relativenumber = true,

    swapfile = false,

    -- Number of lines visible before edge of viewport.
    scrolloff = 5,
    sidescrolloff = 3,

    -- To much hassle with ing nice wrapping, too much inconsistencies across
    --   different environments. Just format text yourself and make people on
    --   github happier.
    -- In case someone sends you unformatted text, format it or use horizontal
    --   commands.
    wrap = false,

    -- - Minimal configuration:
    --autoindent
    --smartindent   -- Do smart autoindenting when starting a new line
    shiftwidth = 2, -- Set number of spaces per auto indentation
    expandtab = true, -- When using <Tab>, put spaces instead of a <tab> character

    -- - Good to have for consistency.
    tabstop = 2, -- Number of spaces that a <Tab> in the file counts for.
    softtabstop = 2,
    smarttab = true, -- At <Tab> at beginning line inserts spaces set in shiftwidth.

    --syntax on
    --filetype plugin indent on

    fileformat = 'unix',

    -- - Persistant undo.
    undodir = '~/. config/.nvim/undo',
    undofile = true,

    -- - Persistant buffers.
    hidden = true,

    -- - Try to reuse windows / tabs when switching buffers.
    switchbuf = 'usetab',

    -- Give freedom to visual mod by allowing it to travel when there's no text.
    virtualedit = 'block',
    termguicolors  = true,

    -- Caching.
    backup = false,
    writebackup = false,
    swapfile = false,
    directory = global.cache_dir .. "swag/",
    undodir = global.cache_dir .. "undo/",
    backupdir = global.cache_dir .. "backup/",
    viewdir = global.cache_dir .. "view/",
    spellfile = global.cache_dir .. "spell/en.uft-8.add",
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
    --sessionoptions = "curdir,help,tabpages,winsize",
    --clipboard      = "unnamedplus",
    --wildignorecase = true,
    --wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",

    --shada          = "!,'300,<50,@100,s10,h",
    --backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
    --smarttab       = true,
    --shiftround     = true,
    --timeout        = true,
    --ttimeout       = true,
    --timeoutlen     = 500,
    --ttimeoutlen    = 10,
    --updatetime     = 100,
    --redrawtime     = 1500,
    --ignorecase     = true,
    --smartcase      = true,
    --infercase      = true,
    --incsearch      = true,
    --wrapscan       = true,
    --complete       = ".,w,b,k",
    --inccommand     = "nosplit",
    --grepformat     = "%f:%l:%c:%m",
    --grepprg        = 'rg --hidden --vimgrep --smart-case --',
    --breakat        = [[\ \	,:,!?]];
    --startofline    = false,
    --whichwrap      = "h,l,<,>,[,],~",
    --splitbelow     = true,
    --splitright     = true,
    --switchbuf      = "useopen",
    --backspace      = "indent,eol,start",
    --diffopt        = "filler,iwhite,internal,algorithm:patience",
    --completeopt    = "menuone,noselect",
    --jumpoptions    = "stack",
    --showmode       = false,
    --shortmess      = "aoOTIcF",
    --scrolloff      = 2,
    --sidescrolloff  = 5,
    --foldlevelstart = 99,
    --ruler          = false,
    --list           = true,
    --showtabline    = 2,
    --winwidth       = 30,
    --winminwidth    = 10,
    --pumheight      = 15,
    --helpheight     = 12,
    --previewheight  = 12,
    --showcmd        = false,
    --cmdheight      = 2,
    --cmdwinheight   = 5,
    --equalalways    = false,
    --laststatus     = 2,
    --display        = "lastline",
    --showbreak      = "↳  ",
    --listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    --pumblend       = 10,
    --winblend       = 10,
  }

  local bw_local  = {
    undofile       = true;
    --synmaxcol      = 2500;
    --formatoptions  = "1jcroql";
    textwidth      = 79;
    expandtab      = true;
    autoindent     = true;
    tabstop        = 2;
    shiftwidth     = 2;
    softtabstop    = -1;
    breakindentopt = "shift:2,min:20";
    wrap           = false;
    linebreak      = true;
    number         = true;
    --colorcolumn    = "80";
    foldenable     = true;
    signcolumn     = "yes";
    conceallevel   = 2;
    concealcursor  = "niv";
  }

  --vim.g.python_host_prog = '/usr/bin/python'
  --vim.g.python3_host_prog = '/usr/local/bin/python3'
  for name, value in pairs(global_local) do
    vim.o[name] = value
  end
  bind_option(bw_local)
end

load_options()

