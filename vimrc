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
set autochdir
set backspace=indent,eol,start
set textwidth=80
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
set path+=/usr/local/otp_src_17.5/lib,**
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
"}}}

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
" Vimscript file settings {{{
augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Erlang file settings {{{
augroup filetype_erlang
        autocmd!
        autocmd FileType erlang set makeprg=erl\ -make 
        autocmd FileType erlang noremap <leader>lv :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.*rl  <CR>:lw<CR>
        autocmd BufRead */usr/local/lib/erlang/*   set tabstop=8
        autocmd BufRead *otp_src*/*   set tabstop=8
augroup END
"vimerl 
let erlang_keywordprg = "erl -man"
let erlang_skel_header={"author":"mingchaoyan@gmail.com","owner":"mingchaoyan","year":"2015"}
let erlang_folding  = 1
nnoremap <silent> <leader>f :r ~/.vim/function.comment<CR>
nnoremap <F5> :make<CR>
noremap <F6> :!erlc +debug_info  -I ./include/ -o ./ebin %<CR>
"}}}

" Lua file settings {{{
augroup filetype_lua
        autocmd!
        autocmd FileType lua noremap <leader>lv :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.lua  <CR>:lw<CR>
augroup END
" }}}

" JavaScript file settings {{{
augroup filetype_JavaScript
        autocmd!
        autocmd FileType javascript set shiftwidth=2
        autocmd FileType json set shiftwidth=2
        let g:javascript_conceal_function   = "ƒ"
        let g:javascript_conceal_null       = "ø"
        let g:javascript_conceal_this       = "@"
        let g:javascript_conceal_return     = "⇚"
        let g:javascript_conceal_undefined  = "¿"
        let g:javascript_conceal_NaN        = "ℕ"
        let g:javascript_conceal_prototype  = "¶"
        let g:javascript_conceal_static     = "•"
        let g:javascript_conceal_super      = "Ω"
augroup END
" }}}

" CoffeeScript file settings {{{
augroup filetype_CoffeeScript
        autocmd!
        autocmd FileType coffee set shiftwidth=2
        autocmd FileType coffee let coffee_indent_keep_current=1
        autocmd FileType coffee unlet b:did_indent | runtime indent/coffee.vim
        autocmd FileType coffee let g:indent_guides_size=2
        autocmd FileType coffee noremap <leader>lg :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.coffee  <CR>:lw<CR>
        autocmd FileType coffee noremap <leader>lf :lv /\<<C-R>=expand("<cword>")<CR>\>/j %  <CR>:lw<CR>
        autocmd FileType coffee noremap set suffixesadd=.coffee
        autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
        autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
        autocmd QuickFixCmdPost * nested cwindow | redraw!
augroup END
"}}}

" Ruby file settings {{{
augroup filetype_Ruby
        autocmd!
        autocmd FileType ruby set shiftwidth=2
        autocmd FileType eruby set shiftwidth=2
        autocmd FileType ruby noremap <leader>lg :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.*rb  <CR>:lw<CR>
        autocmd FileType ruby noremap <leader>lf :lv /\<<C-R>=expand("<cword>")<CR>\>/j %  <CR>:lw<CR>
        autocmd FileType eruby noremap <leader>lg :lv /\<<C-R>=expand("<cword>")<CR>\>/j **/*.*erb  <CR>:lw<CR>
        autocmd FileType eruby noremap <leader>lf :lv /\<<C-R>=expand("<cword>")<CR>\>/j %  <CR>:lw<CR>
augroup END
"}}}

" YAML file settings {{{
augroup filetype_YAML
        autocmd!
        autocmd FileType YAMl set shiftwidth=2
augroup END
"}}}

" Pascal file settings {{{
augroup filetype_Pascal
        autocmd!
        autocmd FileType pascal set shiftwidth=2
augroup END
"}}}

" Misc filetype {{{
autocmd BufRead README set filetype=markdown
autocmd BufRead *.config set filetype=erlang
autocmd BufRead *.app set filetype=erlang
autocmd BufRead *.txt set filetype=lua
" }}}
