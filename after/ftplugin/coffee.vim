set shiftwidth=2
let coffee_indent_keep_current=1
unlet b:did_indent | runtime indent/coffee.vim
let g:indent_guides_size=2
noremap <leader>lg :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.coffee  <CR>:lw<CR>
noremap <leader>lf :lv /\<<C-R>=expand("<cword>")<CR>\>/j %  <CR>:lw<CR>
noremap set suffixesadd=.coffee
setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
autocmd QuickFixCmdPost * nested cwindow | redraw!

