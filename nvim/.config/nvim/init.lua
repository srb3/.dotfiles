if require "stnley.first_load"() then
  return
end

vim.g.mapleader = [[ ]]

require "stnley.options"
require "stnley.keymaps"
require "stnley.plugins"
vim.cmd [[colorscheme dracula]]
