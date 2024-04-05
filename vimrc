" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

setlocal noswapfile " 不要生成swap文件
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
"set termguicolors
"colorscheme molokai " 设定配色方案
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set softtabstop=2 " 使得按退格键时可以一次删掉 2 个空格
set tabstop=2 " 设定 tab 长度为 2
set nobackup " 覆盖文件时不备份
"set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为 1
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
"set tags=~/NJUICS/ics2021/nemu/.tags
set tags=$NEMU_HOME/.tags
"set tags=$AM_HOME/.tags
"set tags=/home/cx/NJUICS/ics2022/am-kernels/.tags
set vb t_vb=
set nohls


set expandtab
set tabstop=2
set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 2

set nowrap

map <F1>  :q!<CR>
map <F2>  :w<CR>:make run mainargs=a<CR>
map <F3>  :s/\%#\d\+/\=printf("0x%x",submatch(0))/g<CR>

map <F5>  :%!clang-format<CR>

map <F9>  :w<CR>:!gcc % -o /tmp/temp.out -lm && /tmp/temp.out < /tmp/in.txt<CR>
"map <F10> :w<CR>:!python3 %<CR>
map <F10> :w<CR>:!python3 % This is a temporary test file<CR>
map <C-K>  <C-V>

"创建文件头
autocmd BufNewFile *.py,*.tex exec ":call SetTitle()"
func! SetTitle()
    if &filetype == 'python'
        call setline(1,"#!/usr/bin/env python3")
        call append(line("."),"# -*- coding:UTF-8 -*-")
        call append(line(".")+1,"##########################################################################")
        call append(line(".")+2, "# File Name: ".expand("%"))
        call append(line(".")+3, "# Author: cx")
        call append(line(".")+4, "# Created Time: ".strftime("%c"))
        call append(line(".")+5, "##########################################################################")
    endif
    if &filetype == 'plaintex'
        call setline(1,"% -*- coding:UTF-8 -*-")
        call append(line("."),"%#########################################################################")
        call append(line(".")+1, "% File Name: ".expand("%"))
        call append(line(".")+2, "% Author: cx")
        call append(line(".")+3, "% Created Time: ".strftime("%c"))
        call append(line(".")+4, "%#########################################################################")
    endif
    normal Go
endfunc

set statusline=%1*\%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例
hi Visual term=bold ctermbg=169
hi User1 cterm=none ctermfg=25 ctermbg=0
hi User2 cterm=none ctermfg=208 ctermbg=0
hi User3 cterm=none ctermfg=169 ctermbg=0
hi User4 cterm=none ctermfg=100 ctermbg=0
hi User5 cterm=none ctermfg=green ctermbg=0
