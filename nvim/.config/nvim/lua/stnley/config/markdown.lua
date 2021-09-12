if packer_plugins["vim-markdown"] and packer_plugins["vim-markdown"].loaded then
  vim.opt.conceallevel = 2
  vim.g.vim_markdown_folding_disabled = 1
end
