local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end


-- * General.
--nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

-- * Investigation.
-- - & is ? in Russian layout.
--nnoremap <silent> <leader>gi& <cmd>lua vim.lsp.buf.hover()<CR>
-- - Implementation.
--nnoremap <silent> <leader>gii <cmd>lua vim.lsp.buf.implementation()<CR>

-- - Declaration.
--nnoremap <silent> <leader>giD <cmd>lua vim.lsp.buf.declaration()<CR>

-- - Type definition.
--nnoremap <silent> <leader>git <cmd>lua vim.lsp.buf.type_definition()<CR>

-- - Definition.
--nnoremap <silent> <leader>gid <cmd>lua vim.lsp.buf.definition()<CR>

-- * Searching.
--nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
--nnoremap <silent> <leader>g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
--nnoremap <silent> <leader>gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


require("config.lsp.lsp-installer")
require("config.lsp.handlers")
--local ENV = require('global');
-- Setup lspconfig.
--require('nvim-lsp-installer').setup {}
--local lspconfig = require('lspconfig')
--local capabilities, on_attach = require('config.lsp.handlers')
--lspconfig.sumneko_lua.setup {}
--lspconfig.pylsp.setup {}
--local configs = require('lspconfig.configs')

-- local servers = { 'pylsp', 'tsserver', 'vimls' }

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- * Python.
--lspconfig.pylsp.setup {
  --on_attach = on_attach,
  --settings = {
    --pylsp = {
      --plugins = {
        --pylint = { enabled = true, executable = "pylint" },
        --pyflakes = { enabled = false },
        --pycodestyle = { enabled = false },
        --jedi_completion = { fuzzy = true },
        --pyls_isort = { enabled = true },
        --pylsp_mypy = { enabled = true },
      --}
    --}
  --},
  --capabilities = capabilities
--}

---- * Typescript.
--lspconfig.tsserver.setup {
  ---- Default values.
  --cmd = { ENV:PATH().npm_global_bin .. '/typescript-language-server', "--stdio" },
  --filetypes = {
    --"javascript", "javascriptreact", "typescript", "typescriptreact" 
  --},
  --init_options = {
    --hostInfo = "neovim"
  --},
  ---- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),

  --capabilities = capabilities,
--}

---- * Vim.
--lspconfig.vimls.setup {
  --cmd = { ENV:PATH().npm_global_modules .. '/vim-language-server/bin/index.js', '--stdio' },

  --capabilities = capabilities,

  --filetypes = { "vim" },
  --init_options = {
    --diagnostic = {
      --enable = true
    --},
    ---- If you want to speed up index, change gap to smaller and count to
    ---- greater, this will cause high CPU usage for some time.
    --indexes = {
      ---- Count of files index at the same time.
      --count = 3,
      ---- Index time gap between next file.
      --gap = 100,
      --projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      ---- Index vim's runtimepath files.
      --runtimepath = true
    --},
    --iskeyword = "@,48-57,_,192-255,-#",
    --runtimepath = "",
    --suggest = {
      --fromRuntimepath = true,
      --fromVimruntime = true
    --},
    --vimruntime = ""
  --},
--}

---- * Linters (diagnostics).
--lspconfig.diagnosticls.setup {
  --capabilities = capabilities,
  --cmd = { ENV:PATH().npm_global_bin .. '/diagnostic-languageserver', "--stdio" },

  --filetypes = {
    --"javascript", "javascriptreact", "typescript", "typescriptreact", "css"
  --},

  --init_options = {
    --filetypes = {
      --javascript = "eslint",
      --typescript = "eslint",
      --javascriptreact = "eslint",
      --typescriptreact = "eslint"
    --},
    --linters = {
      --eslint = {
        --sourceName = "eslint",
        --command = "./node_modules/.bin/eslint",
        --rootPatterns = {
          --".eslitrc.js",
          --".eslitrc",
          --"package.json"
        --},
        --debounce = 100,
        --args = {
          --"--cache",
          --"--stdin",
          --"--stdin-filename",
          --"%filepath",
          --"--format",
          --"json"
        --},
        --parseJson = {
          --errorsRoot = "[0].messages",
          --line = "line",
          --column = "column",
          --endLine = "endLine",
          --endColumn = "endColumn",
          --message = "${message} [${ruleId}]",
          --security = "severity"
        --},
        --securities = {
          --[2] = "error",
          --[1] = "warning"
        --}
      --}
    --},
    --formatters = {
      --prettier = {
        --command = './node_modules/.bin/prettier',
        --args = {'--stdin-filepath', '%filepath'},
      --},
      --eslint = {
        --sourceName = "eslint",
        --command = "./node_modules/.bin/eslint",
        --rootPatterns = {
          --".eslitrc.js",
          --".eslitrc",
          --"package.json"
        --},
        --debounce = 100,
        --args = {
          --"--cache",
          --"--stdin",
          --"--fix",
          --"--stdin-filename",
          --"%filepath",
          --"--format",
          --"json",
        --},
        --parseJson = {
          --errorsRoot = "[0].messages",
          --line = "line",
          --column = "column",
          --endLine = "endLine",
          --endColumn = "endColumn",
          --message = "${message} [${ruleId}]",
          --security = "severity"
        --},
        --securities = {
          --[2] = "error",
          --[1] = "warning"
        --}
      --}
    --},
    --formatFiletypes = {
      --javascript = 'prettier',
      --javascriptreact = 'prettier',
      --typescript = 'prettier',
      --typescriptreact = 'eslint',
      --json = 'prettier',
      --scss = 'prettier',
      --less = 'prettier',
      --markdown = 'prettier',
    --},
  --}
--}

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
