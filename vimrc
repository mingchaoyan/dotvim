"Maintainer: 
"				mingchaoyan
"				mingchaoyan@gmail.com
"Version: 		
"				1.7	
"				2012-11-27
"PluginsNeeded:	
"				vimerl
"				lookupfile
"				genutils
"				taglist
"
"
"pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

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

"Fast edit vimrc
if MySys() == "linux"
	"Fast reload .vimrc
	map <silent> <leader>ss :source ~/.vimrc<cr>
	"Fast edit .vimrc
	map <silent> <leader>ee :tabe ~/.vimrc<cr>
elseif MySys() == "windows"
endif

"General
se nu
se guifont=Consolas:h11
se nobackup
se fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
se go=
se cul
se so=7 "jk 保证有7行的剩余
se shiftwidth=4 "自动缩进时tab设置为4
se tabstop=4
se hlsearch
se expandtab
se magic "除了 $ . * ^ 这四种其他元字符都要加反斜杠\
colo darkblue
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

"taglist setting
let Tlist_Show_One_File = 1 "taglist插件只显示当前文件的tag
let Tlist_Use_Right_Window = 1 "让taglist窗口显示在右边，默认在左边
let Tlist_Exit_OnlyWindow = 1 "退出vim时候退出taglist
se tags=tags;/ "在当前目录找不到tags文件时，请到上层目录去找

"lookupfile setting
let g:LookupFile_MinPatLength=2 " 最少输入2个字符开始查找
let g:LookupFile_PreserveLastPattern=0 " 不保存上次历史
let g:LookupFile_PreservePatternHistory=0 " 不保存上次历史
let g:LookupFile_AlwaysAcceptFirst=1 " 回车打开第一各匹配项
if filereadable("./filenametags")
	let g:LookupFile_TagExpr='"./filenametags"' " 设置tag文件
endif
nmap <silent> <leader>lk <Plug>LookupFile

"vimerl
let g:eralngManPath="/home/mingchaoyan/otp_doc_man_R15B02/man"
let erlang_keywordprg = "man"
let erlang_skel_header={"author":"mingchaoyan","email":"mingchaoyan@gmail.com","com":"www.4399sy.com"}
nmap <F10> :!ctags -R ./*<cr>
nmap <silent> <leader>f :r ~/.vim/function.comment<cr>
nmap <F5> :!erl -make<cr>
map <F6> :!erlc +debug_info  -I ./include/ -o ./ebin %<cr>
map <silent> <leader>en :ErlangEnableShowErrors<cr>
map <silent> <leader>di :ErlangDisableShowErrors<cr>


"Netrw 
let g:netrw_liststyle=3
let g:netrw_winsize   = 90
let g:netrw_altv = 1
