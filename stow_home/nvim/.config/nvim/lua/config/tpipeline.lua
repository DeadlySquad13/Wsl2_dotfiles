local global_local = {
  tpipeline_autoembed = 0,
  tpipeline_fillcentre = 1,
  --tpipeline_preservebg = 1,

  -- Unfortunately, it overwrite laststatus=3 and it's crisp borders so setting
  --   them manually:
  tpipeline_clearstl = 1,
}
--local global_local = ([test]

--)

local fillchars = 'fold: ,stlnc:-,stl:-';

for name, value in pairs(global_local) do
  vim.g[name] = value
end

