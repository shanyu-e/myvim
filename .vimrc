autocmd! bufwritepost .vimrc source ~/.vim/.vimrc

set nu              "不用废话
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set nocompatible    "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
syntax on	    "语法高亮
"DoMatchParen        "配对括号(不明白为什么不好用)
set fileencodings=utf-8
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,gbk
"set foldmethod=indent                   

set smarttab  
set tabstop=4  
set shiftwidth=4  
set expandtab 

"以后改 还有 markdown
"pmenu 所有的颜色  pmenuse 选择的颜色 bg/fg
"highlight Pmenu    guibg=darkgrey  guifg=black
"highlight PmenuSel guibg=lightgrey guifg=black

"----------------关于搜索----------
set hlsearch
set ignorecase
set incsearch
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

"--------------------------------------------------------
"begin               控制的
"--------------------------------------------------------
"set mouse=a        "控制鼠标的，注释关闭，搞笑的是滚轮能用 
set nobackup        "不要备份
set noswapfile      "不要交换文件
"set ignorecase      "搜索忽略大小写
set autoread        "文件自动载入
set autowrite       "自动保存
set numberwidth=4   "行号栏的宽度(你的单文件长会超过1万行？)
"set columns=135    "初始窗口的宽度
"set lines=80        "初始窗口的高度
"winpos 620 45      "初始窗口的位置
"--------------------------------------------------------
"set clipboard+=unnamed 
"--------------------------------------------------------
"begin               各种映射map
"--------------------------------------------------------
"插入环境下复制
imap <C-c> <Esc>"+ya
"可视环境下复制
vmap <C-c> "+y
"插入环境下粘贴(view 不准粘贴)
imap <C-v> <Esc>"+pa
map ,<end> :q!<CR>
map ,z :wq<CR>
"map :q<CR> qa
"map! <C-v> "+pa
"-------------------------------------------------------
"窗口操作

"
"end
"-------------------------------------------------------

"-------------------------------------------------------
"begin    master插件 bundle(还是该叫vundle)
"------------------------------------------------------
filetype on      "没弄清
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"github的格式
Bundle 'gmarik/vundle' 
Bundle 'The-NERD-tree'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
"Bundle 'https://github.com/vim-scripts/VimIM.git'
Bundle 'https://github.com/vimim/vimim.git'
"Bundle 'https://github.com/Lokaltog/powerline.git'
Bundle 'https://github.com/vim-scripts/taglist.vim.git'
Bundle 'https://github.com/vim-scripts/python.vim.git'
Bundle 'https://github.com/kevinw/pyflakes-vim.git'
Bundle 'https://github.com/vim-scripts/pydoc.vim.git'
Bundle 'https://github.com/vim-scripts/Pydiction.git'
Bundle 'https://github.com/vim-scripts/OmniCppComplete.git'
Bundle 'https://github.com/vim-scripts/tags-for-std-cpp-STL-streams-....git'
Bundle 'https://github.com/vim-scripts/load_template.git'
filetype plugin indent on
"-----------------------------------------------------
"omniORstl{{{
        set tags+=~/.vim/tags/cpp/tags
        " configure tags - add additional tags here or comment out not-used ones
        set tags+=~/.vim/tags/gl
        set tags+=~/.vim/tags/sdl
        set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
        map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" OmniCppComplete
        let OmniCpp_NamespaceSearch = 1
        let OmniCpp_GlobalScopeSearch = 1
        let OmniCpp_ShowAccess = 1
        let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
        let OmniCpp_MayCompleteDot = 1 " autocomplete after .
        let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
        let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
        let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menuone,menu,longest,preview
"}}}
"powerline{{{
          set laststatus=2 
          "set guifont=PowerlineSymbols\ for\ Powerline
          set t_Co=256 
          let g:Powerline_symbols = 'fancy' 
          let Powerline_symbols = 'compatible' 
          set encoding=utf8
"}}}
"DTree配置{{{
          map <F2> :NERDTreeToggle<CR>
          map <C-F1> :NERDTreeFind<CR>
	      let NERDTreeChDirMode=2  "选中root即设置为当前目录
          let NERDTreeQuitOnOpen=0 "打开文件时关闭树
          let NERDTreeShowBookmarks=1 "显示书签
          let NERDTreeMinimalUI=1 "不显示帮助面板
          let NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号
"}}}														        "}}}
"vimim配置{{{
         " let g:vimim_cloud = 'google,sogou,baidu,qq'  
         " let g:vimim_map = 'tab_as_gi'
        let g:vimim_map='c-space'
        "let g:vimim_mycloud = "py:127.0.0.1"
"}}}
"taglis配置{{
        "map :lhelp :help taglist<CR><CR>
        map <F3> :TlistToggle<CR>
        let Tlist_Show_One_File=0
        let Tlist_Exit_OnlyWindow=1
        let Tlist_Ctags_Cmd = '/usr/bin/ctags'
        let Tlist_Use_Right_Window=1
        let Tlist_File_Fold_Auto_Close=1
        let Tlist_GainFocus_On_Toggle=1
"}}
"pydoc 配置{{
        let g:pydoc_cmd = '/usr/bin/pydoc2.7'   "K弹出文档
"}}
"pyfla 配置{{
        "就是个 ：cc
"}}
"pydic 配置{{
       let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
"}}
"loadT 配置{{
        let g:template_path='~/.vim/bundle/load_template/template'
        map ,l :LoadTemplate<CR>
"}}




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题   ma6174大神的
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.h exec ":call SetTitle3()"
func! SetTitle3()
    call setline(1, "/*************************************************************************") 
	call append(line("."), "	> File Name: ".expand("%")) 
	call append(line(".")+1, "	> Author:shanyue") 
	call append(line(".")+2, "	> Mail: 554816284@qq.com ") 
	call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
	call append(line(".")+4, " ************************************************************************/") 
    call append(line(".")+5, "")
endfunc 
autocmd BufNewFile * normal G



autocmd BufNewFile *.cpp,*.c,*.sh,*.java,*.py exec ":call SetTitle2()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle2()
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "#***********************************************************************")
        call append(line(".")+2, "# > File Name: ".expand("%"))
        call append(line(".")+3, "# > Author:shanyue") 
		call append(line(".")+4, "# > Mail: 554816284@qq.com ") 
		call append(line(".")+5, "# > Created Time: ".strftime("%c")) 
		call append(line(".")+6, "#***********************************************************************") 
		call append(line(".")+7, "")
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author:shanyue") 
		call append(line(".")+2, "	> Mail: 554816284@qq.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
    if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
    elseif &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
"	if &filetype == 'java'
"		call append(line(".")+6,"public class ".expand("%"))
"		call append(line(".")+7,"")
"	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc
"------------------------------------------------------------------------------
"辞秋大神的           http://wiki.ktmud.com/tips/Vim.html
"-----------------------------------------------------------------------------
let $VIMFILES = $HOME.'/.vim'
let $V = $HOME.'/.vimrc'
"persistent undo 
set undofile
set undodir =$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone
"保存工作环境
autocmd BufWinLeave . if expand('%') != '' && &buftype == '' | mkview | endif
autocmd BufRead . if expand('%') != '' && &buftype == '' | silent loadview | syntax on | endif
"删除大于90天的
"function! RemoveOldViewFiles
"    exe 'find '.$VIMFILES.'/view* -mtime +90 -exec rm {} \;'
"endfunction
"nmap <leader>.cl :call RemoveOldViewFiles<cr>

set sessionoptions+=unix
set sessionoptions-=blank
"set sessionoptions-=options
autocmd VimEnter * call LoadSession()
autocmd VimLeave * call MakeSession() 

function! MakeSession()
    if !has('gui_running')
        hi clear
    endif
    if bufname('')  == ''
        exe 'bdelete '.bufnr('')
    endif
    let l:count = 0
    let l:i = 0
    while l:i <= bufnr('$')
        if buflisted(count)
            let l:count += 1
        endif
        let l:i+=1
    endwhile
    if l:count >= 4
        mksession! ~/.last_session.vim
    endif
endfunction

function! LoadSession()
    "if exists('g:SessionLoaded')
    "return
    "endif
    if expand('%') == '' && filereadable($HOME.'/.last_session.vim') && !&diff
        silent so ~/.last_session.vim
    endif

    let l:buftotal = bufnr('$')
    let l:i = 0
    let l:crtpath = getcwd() 
    while l:i <= l:buftotal
        if !bufloaded(l:i) && buflisted(l:i) && expand('%:p') !~ l:crtpath
            exe 'bdelete '.l:i
            echo expand('%:p') .' !~ '. l:crtpath
        endif
        let l:i += 1
    endwhile
endfunction
"－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－over
