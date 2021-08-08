if require "stnley.first_load"() then
  return
end

vim.g.mapleader = " "

require "stnley.plugins"
vim.cmd [[colorscheme dracula]]

require "stnley.lsp"
require "stnley.telescope"
