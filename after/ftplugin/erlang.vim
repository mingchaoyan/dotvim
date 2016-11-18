set makeprg=erl\ -make 
noremap <leader>lv :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.*rl  <CR>:lw<CR>
set path+=/usr/local/otp_src_17.5/lib
let erlang_keywordprg = "erl -man"
let erlang_skel_header={"author":"mingchaoyan@gmail.com","owner":"mingchaoyan","year":"2016"}
let erlang_folding  = 1
nnoremap <silent> <leader>f :r ~/.vim/function.comment<CR>
nnoremap <F5> :make<CR>
noremap <F6> :!erlc +debug_info  -I ./include/ -o ./ebin %<CR>
