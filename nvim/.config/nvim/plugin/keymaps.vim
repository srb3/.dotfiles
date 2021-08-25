" " greatest remap ever
" vnoremap <leader>p "_dP

" " next greatest remap ever : asbjornHaland
" nnoremap <leader>y "+y
" vnoremap <leader>y "+y
" " nnoremap <leader>Y gg"+yG wtf does this do?

" nnoremap <leader>d "_d
" vnoremap <leader>d "_d

" " move lines
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fp <cmd>lua require('telescope.builtin').file_browser()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
" nnoremap <leader>ht <cmd>lua require('telescope.builtin').help_tags()<cr>

" augroup highlight_yank
"     autocmd!
"     autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
" augroup END

" " remove whitespace
" augroup stnly
"     autocmd BufWritePre * %s/\s\+$//e
"     autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
" augroup END
