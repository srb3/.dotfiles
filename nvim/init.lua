if require "stnley.first_load"() then
  return
end

require "stnley.plugins"
vim.cmd [[colorscheme dracula]]

require "stnley.lsp"
