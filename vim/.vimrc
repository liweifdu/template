" vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" some usefull settings
filetype on
syntax on

set number
set autoread
set noeb

" tab, search,indent settings
set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
set smarttab
autocmd BufRead,BufNewFile make,makefile,Makefile set noexpandtab

set showmatch
set hlsearch
set incsearch

set autoindent
set smartindent
set cindent

set mouse=a
set showcmd
set ruler

" map the keyboard
map <C-A> ggVG
map <F12> gg=G
map <F2> :tabnew
map <F3> :left

" vmap the keyboard
vmap <C-c> "+y

" remap the gf
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf
inoremap <C-u> <esc>gUiwea

nnoremap <silent> <F4> :TagbarToggle<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>

" close bell
set vb t_vb=
au GuiEnter * set t_vb=

" advanced settings
set completeopt=preview,menu
set clipboard+=unnamed

" auto completement
autocmd BufRead,BufNewFile *.cpp iabbrev for for (int i = 0; i < ; ++i) {!cursor!<Enter>}<Esc>:call search('!cursor!','b')<CR>cf!
autocmd BufRead,BufNewFile *.v iabbrev begin begin!cursor!<Enter>end<Esc>:call search('!cursor!','b')<CR>cf!
autocmd BufRead,BufNewFile *.v iabbrev alw always @(posedge clk or negedge rstn) begin<Enter>  if(!rstn) begin<Enter>end<Enter>else begin<Enter>end<Enter>end<Esc>:call search('!cursor!','b')<CR>cf!

" fold settings
set foldcolumn=0
set foldmethod=marker
set foldlevel=3
set foldenable

" cursor
set cursorline
set cursorcolumn

" colorscheme blayu

"""""""""""""""""""""""""""""""""new file""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""some information"""""""""""""""""""""""""""""""""""""
" auto add the file title
func SetCommentC()        
    call setline(1, "/*************************************************************************")
    call append(line("."), "    > File Name: ".expand("%"))
    call append(line(".")+1, "    > Author: WeiLi")
    call append(line(".")+2, "    > Mail: lweifdu@gmail.com")
    call append(line(".")+3, "    > Created Time: ".strftime("%c"))
    call append(line(".")+4, "    > Description: ")
    call append(line(".")+5, " ************************************************************************/")
    call append(line(".")+6, "")
endfunc

func SetCommentShAndMake() 
    call setline(1, "\#########################################################################")
    call setline(2, "\# File Name: ".expand("%"))
    call setline(3, "\# Author: WeiLi")
    call setline(4, "\# Mail: lweifdu@gmail.com")
    call setline(5, "\# Created Time: ".strftime("%c"))
    call setline(6, "\# Description: ")
    call setline(7, "\#########################################################################")
endfunc

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.pl,*.java,*.v,makefile exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call SetCommentShAndMake()
        call setline(8,"\#!/bin/bash")
        call setline(9,"")

    elseif &filetype == 'perl'
        call SetCommentShAndMake()
        call setline(8,"\#!/usr/bin/perl")
        call setline(9,"")

    elseif &filetype == 'make'
        call SetCommentShAndMake()
        call setline(8,"")
        call setline(9,"")

    else
        call SetCommentC()
        if &filetype == 'cpp'
            call append(line(".")+7, "#include<iostream>")
            call append(line(".")+8, "using namespace std;")
            call append(line(".")+9, "")

        elseif &filetype == 'c'
            call append(line(".")+7, "#include<stdio.h>")
            call append(line(".")+8, "")
            call append(line(".")+9, "")
        endif

    endif
    autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""end newfile""""""""""""""""""""""""""""""""""""""""

" CTags settings
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_left = 1
let g:tagbar_width = 30