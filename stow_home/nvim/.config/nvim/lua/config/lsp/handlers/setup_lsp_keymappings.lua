local prequire = require('utils').prequire

local setup_lsp_keymappings = function(bufnr)
  local which_key_is_available, which_key = prequire('which-key')

  local lsp_buf = vim.lsp.buf
  local lsp_diagnostic = vim.diagnostic

  local format_mappings_names =
  require('config.which_key.which_key_utils').format_mappings_names

  if which_key_is_available then
    -- Mappings.
    local options = {
      -- prefix: use "<leader>f" for example for mapping everything related to finding files
      -- the prefix is prepended to every mapping part of `mappings`.
      prefix = '',
      buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings.
      silent = true, -- use `silent` when creating keymaps.
      -- use `noremap` when creating keymaps (when command starts with <Plug>,
      -- noremap = false is set automatically).
      noremap = true,
      nowait = false, -- use `nowait` when creating keymaps
    }

    --local rename = (function()
    --local renamer_is_available, renamer = pcall(require, "renamer");
    --if not renamer_is_available then
    --return lsp_buf.rename;
    --end

    --return renamer.rename;
    --end)()

    local mappings = {}

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


    --vim.keymap.set("n", "gd", lsp_buf.definition, opts)
    --vim.keymap.set("n", "<C-]>", lsp_buf.definition, opts)
    --vim.keymap.set("n", "K", lsp_buf.hover, opts)
    --vim.keymap.set("n", "<C-k>", lsp_buf.signature_help, opts)
    --vim.keymap.set("n", "<space>wa", lsp_buf.add_workspace_folder, opts)
    --vim.keymap.set("n", "<space>wr", lsp_buf.remove_workspace_folder, opts)
    --vim.keymap.set("n", "<space>wl", function() print(vim.inspect(lsp_buf.list_workspace_folders())) end, opts)
    --vim.keymap.set("n", "<space>rn", lsp_buf.rename, opts)
    --vim.keymap.set("n", "gr", lsp_buf.references, opts)
    --vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    --vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    --vim.keymap.set("n", "<space>q", function() vim.diagnostic.setqflist({open = true}) end, opts)
    --vim.keymap.set("n", "<space>ca", lsp_buf.code_action, opts)

    mappings.n = {
      name = 'LSP',

      ['gd'] = { lsp_buf.definition, 'Jump to definition' },
      ['<c-]>'] = { lsp_buf.definition, 'Jump to definition' },
      ['K'] = { lsp_buf.hover, 'Hover' },
      ['<c-k>'] = { lsp_buf.signature_help, 'Signature help' },
      ['<space>wa'] = { lsp_buf.add_workspace_folder, 'Add workspace folder' },
      ['<space>wr'] = {
        lsp_buf.remove_workspace_folder,
        'Remove workspace folder',
      },
      ['<space>wl'] = {
        function()
          vim.pretty_print(lsp_buf.list_workspace_folders())
        end,
        'List workspace folders',
      },
      ['<space>rs'] = { lsp_buf.rename, 'Rename Symbol' },
      ['<space>ca'] = { lsp_buf.code_action, 'Code Action' }, -- Change from `c`.
      ['gr'] = { lsp_buf.references, 'References' },
      ['<space>q'] = {
        function()
          vim.diagnostic.setqflist({ open = true })
        end,
        'Send diagnostic to quickfix list',
      },

      ['<space>ff'] = { lsp_buf.format, 'Format' },

      ['[d'] = { lsp_diagnostic.goto_prev, 'Goto previous diagnostic' },
      [']d'] = { lsp_diagnostic.goto_next, 'Goto next diagnostic' },
    }

    mappings.x = {
      ['<space>ff'] = { lsp_buf.format, 'Format' },
    }

    local n_options = { mode = 'n', unpack(options) }
    which_key.register(format_mappings_names(mappings.n, 'M'), n_options)
    local x_options = { mode = 'n', unpack(options) }
    which_key.register(format_mappings_names(mappings.x, 'M'), x_options)
  end
end

return setup_lsp_keymappings
