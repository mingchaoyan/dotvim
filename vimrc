"Maintainer: 
"               mingchaoyan at gmail.com
"Version:   
"               3.4
"PluginsNeeded: {{{
"               pathogen
"               vimerl
"               lookupfile
"               genutils
"               taglist
"               nerdtree
"               tabular
"}}}
"ChangeLog: {{{
"               * 3.4.2 
"                   - 使用autocmd 定制同一个命令在不同文件类型下的表现
"               * 3.4.1 
"                   - use window to display man page
"               * 3.4
"                   - powerline
"               * 3.3
"                   - vcscommand
"               * 3.2 
"                   - calendar
"               * 3.1
"                   - tabular
"               * 3.0
"                   - multi-platform support
"               * 2.0
"                   - add nerdtree
"}}}

"pathogen {{{
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
"}}}

"general {{{
inoremap jk <esc>
inoremap <esc> <nop>
set nocompatible   
set laststatus=2   " Always show the statusline
set number
if v:version >= 703
    set relativenumber
endif
set guifont=Consolas:h11
set nobackup
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set go=
set ignorecase smartcase
set scrolloff=7 
set shiftwidth=4 
set tabstop=4
set expandtab
set list
set lcs=tab:\|\ 
set path+=/usr/local/src/otp_src_R15B02,**
set define=-define
set include=-include
set magic "除了 $ . * ^ 这四种其他元字符都要加反斜杠\
set makeprg=erl\ -make 
set showcmd
set t_Co=256
colorscheme desert
set cursorcolumn
set cursorline
hi CursorLine cterm=None ctermbg=DarkBlue
hi CursorColumn cterm=NONE ctermbg=DarkBlue
nnoremap <space> za
set showmatch
set matchtime=5
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction
let mapleader=","
if MySys() == "windows"
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif
set foldcolumn=2
nnoremap <silent> <F10> :!ctags -R<CR>
"}}}

" load plugins that ship with Vim {{{
runtime ftplugin/man.vim
"}}}

" vimrc {{{
nnoremap <leader>ee :split $MYVIMRC<CR>
nnoremap <leader>ss :source $MYVIMRC<CR>
"}}}

"taglist setting {{{
let Tlist_Show_One_File = 1 
let Tlist_Use_Right_Window = 1 
let Tlist_Exit_OnlyWindow = 1 
noremap <silent> <F9> :TlistToggle<CR>
set tags=tags,/usr/local/src/otp_src_R15B02/lib/stdlib/tags 
"}}}

"lookupfile setting {{{
let g:LookupFile_MinPatLength=2 
let g:LookupFile_UsingSpecializedTags = 1
let g:LookupFile_PreserveLastPattern=0 
let g:LookupFile_PreservePatternHistory=1 
let g:LookupFile_AllowNewFiles = 1
let g:LookupFile_AlwaysAcceptFirst=1 
if filereadable("./.filenametags")
    let g:LookupFile_TagExpr='"./.filenametags"' 
endif
map <silent> <leader>lk <Plug>LookupFile
"}}}

"vimerl {{{
if MySys() == "linux"
    let g:eralngManPath="/home/mingchaoyan/otp_doc_man_R15B02/man"
    let erlang_keywordprg = "man"
    let erlang_skel_header={"author":"mingchaoyan","owner":"4399","year":"2013"}
    let erlang_folding  = 1
    "nnoremap <F10> :!./.genfilenametags.sh<CR>
    nnoremap <silent> <leader>f :r ~/.vim/function.comment<CR>
    nnoremap <F5> :make<CR>
    noremap <F6> :!erlc +debug_info  -I ./include/ -o ./ebin %<CR>
    noremap <silent> <leader>en :ErlangEnableShowErrors<CR>
    noremap <silent> <leader>di :ErlangDisableShowErrors<CR>
elseif MySys() == "windows"
endif
"}}}

"nerdtree {{{
noremap <F4> :NERDTreeToggle<CR>
let NERDTreeDirArrows=0
"}}}

"snipmate {{{
noremap <silent> <leader>sn :tabnew ~/.vim/bundle/snipmate.vim/snippets/erlang.snippets<CR>
"}}}

" vcscommand{{{
let VCSCommandResultBufferNameExtension=".vcs"
" }}}

" search {{{
set hlsearch
set incsearch
noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
autocmd FileType erlang noremap <leader>lv :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.*rl  <CR>:lw<CR>
autocmd FileType lua noremap <leader>lv :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.lua  <CR>:lw<CR>
"}}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ULua file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType text setlocal filetype=lua
    let NERDTreeIgnore=['\.meta$', '\~$']
augroup END
" }}}
