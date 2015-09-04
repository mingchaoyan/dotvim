"Maintainer: 
"               mingchaoyan at gmail.com
"Version:   
"               3.5
"PluginsNeeded: {{{
"               pathogen
"               vimerl
"               lookupfile
"               genutils
"               taglist
"               nerdtree
"               tabular
"               vim-misc
"               vim-lua-ftplugin
"               SingleCompile
"}}}
"ChangeLog: {{{
"               * 3.5 
"                   - 添加lua插件
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

"load plugins by platform {{{
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction
if MySys() == "windows"
    let g:pathogen_disabled = ['vimerl']
endif
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
set laststatus=2 
set number
if v:version >= 703
    set relativenumber
endif
set guifont=Consolas:h12
set nobackup
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set go=
set ignorecase smartcase
set scrolloff=7 
set shiftwidth=4 
set tabstop=4
set expandtab
set nolist
set lcs=tab:\|\ 
set path+=/usr/local/otp_src_17.5/lib,**
set define=-define
set include=^\s*[#,-]\s*include
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
let mapleader=","
if MySys() == "windows"
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif
set foldcolumn=2
nnoremap <silent> <F10> :!ctags -R<CR>
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
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
let g:LookupFile_DefaultCmd = ':LUPath'
let g:LookupFile_FileFilter = '\.meta$\|\.beam$'
map <silent> <leader>lk <Plug>LookupFile
"}}}

"vimerl {{{
let erlang_keywordprg = "erl -man"
let erlang_skel_header={"author":"mingchaoyan@gmail.com","owner":"mingchaoyan","year":"2015"}
let erlang_folding  = 1
nnoremap <silent> <leader>f :r ~/.vim/function.comment<CR>
nnoremap <F5> :make<CR>
noremap <F6> :!erlc +debug_info  -I ./include/ -o ./ebin %<CR>
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
"augroup filetype_vim
"    autocmd!
"    autocmd FileType text setlocal filetype=lua
"    let NERDTreeIgnore=['\.meta$', '\~$']
"augroup END
" }}}

" Misc filetype {{{
autocmd BufRead README set filetype=markdown
autocmd BufRead *.config set filetype=erlang
autocmd BufRead *.app set filetype=erlang

" }}}

" Erlang source code filesettings {{{
autocmd BufRead */usr/local/lib/erlang/*   set tabstop=8
autocmd BufRead *otp_src*/*   set tabstop=8
" }}}

" SingleCompile {{{
nmap <leader>rr :SingleCompileRun<CR>
 "}}}
 
 " DirDiff {{{
 let g:DirDiffExcludes = "*.meta,*.so,*.a,*.dll,*DS_Store"
 let g:DirDiffAddArgs = "-w" 
 " }}}
