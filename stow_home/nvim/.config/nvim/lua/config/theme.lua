local COLORSCHEME_NAME = 'deadly-gruv'

local function load_coloscheme(colorscheme_name)
  local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. COLORSCHEME_NAME)

  if not status_ok then
    return notify('colorscheme ' .. colorscheme_name .. ' not found!')
  end
end

load_coloscheme(COLORSCHEME_NAME)
