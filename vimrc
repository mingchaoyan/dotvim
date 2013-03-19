"Maintainer: 
"               mingchaoyan
"               mingchaoyan at gmail.com
"Version:   
"               3.4
"PluginsNeeded:
"               pathogen
"               vimerl
"               lookupfile
"               genutils
"               taglist
"               nerdtree
"               tabular
"ChangeLog:
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
"
"
"pathogen
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" load plugins that ship with Vim {{{
"runtime ftplugin/man.vim
"}}}

"Platform
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction

"Set mapleader
let mapleader=","

function! SwitchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction

"Fast edit vimrc
if MySys() == "linux"
    "Fast reload .vimrc
    map <silent> <leader>ss :source ~/.vimrc<CR>
    "Fast edit .vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<CR>
    " When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
elseif MySys() == "windows"
    "Fast reload .vimrc
    map <silent> <leader>ss :source ~/_vimrc<cr>
    "Fast edit .vimrc
    map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>
endif

"For windows version
if MySys() == "windows"
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

"General
se nocompatible   
se laststatus=2   " Always show the statusline
se nu
se guifont=Consolas:h11
se nobackup
se fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
se go=
se ignorecase smartcase
se so=7 
se shiftwidth=4 
se tabstop=4
se expandtab
se hlsearch
se list

se lcs=tab:\|\ 
se path+=/usr/local/src/otp_src_R15B02,**
se define=-define
se include=-include
se magic "除了 $ . * ^ 这四种其他元字符都要加反斜杠\
se incsearch
se makeprg=erl\ -make 

se showcmd
"se foldmethod=indent

set t_Co=256
colo desert
se cursorcolumn
se cursorline
hi CursorLine cterm=None ctermbg=DarkBlue
hi CursorColumn cterm=NONE ctermbg=DarkBlue

map <leader>g :vimgrep // **/*.erl<left><left><left><left><left><left><left><left><left><left>
map <leader>lv :lv /\<<C-R>=expand("<cword>")<cr>\>/j **/*.erl<cr>:lw<cr>

"taglist setting
let Tlist_Show_One_File = 1 
let Tlist_Use_Right_Window = 1 
let Tlist_Exit_OnlyWindow = 1 
map <silent> <F9> :TlistToggle<cr>
se tags=tags,/usr/local/src/otp_src_R15B02/lib/stdlib/tags 

"lookupfile setting
let g:LookupFile_MinPatLength=2 
let g:LookupFile_UsingSpecializedTags = 1
let g:LookupFile_PreserveLastPattern=0 
let g:LookupFile_PreservePatternHistory=1 
let g:LookupFile_AllowNewFiles = 1
let g:LookupFile_AlwaysAcceptFirst=1 
if filereadable("./filenametags")
    let g:LookupFile_TagExpr='"./filenametags"' 
endif
nmap <silent> <leader>lk <Plug>LookupFile

"vimerl
if MySys() == "linux"
    let g:eralngManPath="/home/mingchaoyan/otp_doc_man_R15B02/man"
    let erlang_keywordprg = "man"
    let erlang_skel_header={"author":"mingchaoyan","email":"mingchaoyan@gmail.com","com":"www.4399.com"}
    let erlang_folding  = 0
    nmap <F10> :!./genfilenametags.sh<cr>
    nmap <silent> <leader>f :r ~/.vim/function.comment<cr>
    nmap <F5> :make<cr>
    "autocmd BufWritePost *.erl :!erlc +debug_info  -I ./include/ -o ./ebin %<cr>
    map <F6> :!erlc +debug_info  -I ./include/ -o ./ebin %<cr>
    map <silent> <leader>en :ErlangEnableShowErrors<cr>
    map <silent> <leader>di :ErlangDisableShowErrors<cr>
elseif MySys() == "windows"
endif

"nerdtree
map <F4> :NERDTreeToggle<cr>
let NERDTreeDirArrows=0

"snipmate
"
map <silent> <leader>sn :tabnew ~/.vim/bundle/snipmate.vim/snippets/erlang.snippets<cr>

