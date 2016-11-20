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
set path=**
set backspace=indent,eol,start
"set textwidth=80
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
set tabstop=8
set expandtab
set define=-define
set include=^\s*[#,-]\s*include
set magic "除了 $ . * ^ 这四种其他元字符都要加反斜杠\
set showcmd
set t_Co=256
set cursorcolumn
set cursorline
set colorcolumn=80
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=234 ctermfg=NONE
syntax enable
set background=dark
colorscheme solarized
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
cmap w!! w !sudo tee > /dev/null %
"}}}

" load plugins that ship with Vim {{{
runtime ftplugin/man.vim
"}}}

" search {{{
set hlsearch
set incsearch
noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
"}}}

" vimrc {{{
nnoremap <leader>ee :split $MYVIMRC<CR>
nnoremap <leader>ss :source $MYVIMRC<CR>
"}}}

" nerd {{{
let NERDTreeIgnore=['\.meta$', '\~$']
" }}}

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
 " }}}

"snipmate {{{
noremap <silent> <leader>sn :tabnew ~/.vim/bundle/snipmate.vim/snippets/erlang.snippets<CR>
"}}}

" vcscommand{{{
let VCSCommandResultBufferNameExtension=".vcs"
" }}}

" SingleCompile {{{
nmap <leader>rr :SingleCompileRun<CR>
"}}}

" DirDiff {{{
let g:DirDiffExcludes = "*.meta,*.so,*.a,*.dll,*DS_Store"
let g:DirDiffAddArgs = "-w" 
" }}}

" powerline {{{
let g:Powerline_colorscheme = 'solarized256'
"  }}}

" dash {{{
nnoremap <leader>da :Dash<CR>
"  }}}

" EditorConfig settings {{{
"let g:EditorConfig_verbose = 1
"}}}

" YouCompleteMe settings {{{
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_seed_identifiers_with_syntax=1
"}}}
