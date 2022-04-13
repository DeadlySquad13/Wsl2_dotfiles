-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dubuntus/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/dubuntus/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/dubuntus/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/dubuntus/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dubuntus/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["TrueZen.nvim"] = {
    config = { " require ('config.true_zen') " },
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["YankAssassin.vim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/YankAssassin.vim",
    url = "https://github.com/svban/YankAssassin.vim"
  },
  ["cmd-parser.nvim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/cmd-parser.nvim",
    url = "https://github.com/winston0410/cmd-parser.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lspconfig" },
    after_files = { "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    after_files = { "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips/after/plugin/cmp_nvim_ultisnips.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    after_files = { "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim",
    url = "https://github.com/tjdevries/colorbuddy.nvim"
  },
  ["dashboard-nvim"] = {
    cond = { "\27LJ\2\n5\0\0\1\0\3\0\0056\0\0\0009\0\1\0009\0\2\0\19\0\0\0L\0\2\0\24started_by_firenvim\6g\bvim\0" },
    config = { " require('config.dashboard') " },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  firenvim = {
    config = { " require('config.firenvim') " },
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { " require('config.indent_blankline') " },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jupyter_ascending.vim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/jupyter_ascending.vim",
    url = "https://github.com/untitled-ai/jupyter_ascending.vim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  mkdx = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/mkdx",
    url = "https://github.com/SidOfc/mkdx"
  },
  nerdcommenter = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-autopairs"] = {
    config = { " require ('config.nvim_autopairs') " },
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { " require ('config.colorizer') " },
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-hlslens"] = {
    keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/nvim-peekup",
    url = "https://github.com/gennaro-tedesco/nvim-peekup"
  },
  ["nvim-treesitter"] = {
    after = { "indent-blankline.nvim", "twilight.nvim" },
    config = { " require('config.treesitter')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["range-highlight.nvim"] = {
    config = { " require('config.range_highlight') " },
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/range-highlight.nvim",
    url = "https://github.com/winston0410/range-highlight.nvim"
  },
  ["rel.vim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/rel.vim",
    url = "https://github.com/aklt/rel.vim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["tabout.nvim"] = {
    config = { " require('config.tabout') " },
    load_after = {
      ["which-key.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  ["targets.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-word-column.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/textobj-word-column.vim",
    url = "https://github.com/idbrii/textobj-word-column.vim"
  },
  tinykeymap_vim = {
    after = { "tabout.nvim" },
    loaded = true,
    only_config = true
  },
  ["train.nvim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/train.nvim",
    url = "https://github.com/tjdevries/train.nvim"
  },
  ["twilight.nvim"] = {
    config = { " require ('config.twilight') " },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-autopep8"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/vim-autopep8",
    url = "https://github.com/tell-k/vim-autopep8"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-omnipresence"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-omnipresence",
    url = "https://github.com/majkinetor/vim-omnipresence"
  },
  ["vim-plugin-ruscmd"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-plugin-ruscmd",
    url = "https://github.com/powerman/vim-plugin-ruscmd"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/vim-textobj-indent",
    url = "https://github.com/kana/vim-textobj-indent"
  },
  ["vim-textobj-indented-paragraph"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/vim-textobj-indented-paragraph",
    url = "https://github.com/pianohacker/vim-textobj-indented-paragraph"
  },
  ["vim-textobj-user"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-wordmotion"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  ["which-key.nvim"] = {
    after = { "tabout.nvim" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.which_key\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3Ð\aB\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["xonsh-vim"] = {
    loaded = true,
    path = "/home/dubuntus/.local/share/nvim/site/pack/packer/start/xonsh-vim",
    url = "https://github.com/abhishekmukherg/xonsh-vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
 require ('config.colorizer') 
time([[Config for nvim-colorizer.lua]], false)
-- Config for: TrueZen.nvim
time([[Config for TrueZen.nvim]], true)
 require ('config.true_zen') 
time([[Config for TrueZen.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
 require ('config.nvim_autopairs') 
time([[Config for nvim-autopairs]], false)
-- Config for: firenvim
time([[Config for firenvim]], true)
 require('config.firenvim') 
time([[Config for firenvim]], false)
-- Config for: tinykeymap_vim
time([[Config for tinykeymap_vim]], true)
 require('config.tinykeymap') 
time([[Config for tinykeymap_vim]], false)
-- Config for: range-highlight.nvim
time([[Config for range-highlight.nvim]], true)
 require('config.range_highlight') 
time([[Config for range-highlight.nvim]], false)
-- Conditional loads
time([[Conditional loading of dashboard-nvim]], true)
  require("packer.load")({"dashboard-nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of dashboard-nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope.nvim ]]
vim.cmd [[ packadd nvim-cmp ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd ultisnips ]]
vim.cmd [[ packadd cmp-nvim-ultisnips ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[nnoremap <silent> * <cmd>lua require("packer.load")({'nvim-hlslens'}, { keys = "*", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> N <cmd>lua require("packer.load")({'nvim-hlslens'}, { keys = "N", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> n <cmd>lua require("packer.load")({'nvim-hlslens'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> # <cmd>lua require("packer.load")({'nvim-hlslens'}, { keys = "#", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-autopep8'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'mkdx'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'indent-blankline.nvim', 'nerdcommenter', 'textobj-word-column.vim', 'which-key.nvim', 'targets.vim', 'vim-repeat', 'vim-textobj-indent', 'vim-textobj-indented-paragraph', 'vim-textobj-user', 'vim-wordmotion'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-ts-rainbow', 'nvim-treesitter'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
