local status_ok, neogen = pcall(require, 'neogen')
if not status_ok then
  return
end

neogen.setup({
  enabled = true,
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  languages = {
    --python = {
      --template = {
        --annotation_convention = 'reST'
      --}
    --}
  }
})


-- python = require('config.neogen.settings.python')

--local opts = { noremap = true, silent = true }
--local keymap = vim.api.nvim_set_keymap
--keymap('n', "<Leader>/d", ':lua require("neogen").generate()<CR>', opts)
