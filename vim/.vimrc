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

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
" Plugin 'SirVer/ultisnips'
Plugin 'edsono/vim-matchit'
" Plugin 'elzr/vim-json'
" Plugin 'honza/vim-snippets'
" Plugin 'justinmk/vim-sneak'
" Plugin 'kien/ctrlp.vim'
" Plugin 'ludovicchabant/vim-lawrencium'
" Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-signify'
Plugin 'plasticboy/vim-markdown'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'sjl/gundo.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-sleuth'
" Plugin 'tpope/vim-surround'
" Plugin 'tyru/open-browser.vim'
" Plugin 'vim-scripts/a.vim'
" Plugin 'scrooloose/nerdtree'

" Color schemes
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tomasiser/vim-code-dark'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" some usefull settings
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

" map for terminal debug, enable when vim's 
" version is greater than v8.1
nnoremap <F4> :terminal ++rows=10<CR><c-w>x
nnoremap <F5> :Continue<CR>
nnoremap <S-F5> :Stop<CR>
nnoremap <F9> :Break<CR>
nnoremap <S-F9> :Clear<CR>
nnoremap <F10> :Over<CR>
nnoremap <F11> :Step<CR>

" vmap the keyboard
vmap <leader>y "+y
vmap <leader>p "+p

" remap the upcase
inoremap <C-u> <esc>gUiwea

" close bell
set vb t_vb=
au GuiEnter * set t_vb=

" advanced settings
set completeopt=preview,menu
set clipboard+=unnamed

" auto completement
autocmd BufRead,BufNewFile *.v iabbrev alw always @(posedge clk or negedge rstn) begin<Enter>  if(!rstn) begin<Enter>end<Enter>else begin<Enter>end<Enter>end<Esc>:call search('!cursor!','b')<CR>cf!

" fold settings
set foldcolumn=0
set foldmethod=indent
set foldlevel=3
set foldenable

" cursor
set cursorline
set cursorcolumn

" other settings
" diff
set diffopt+=iwhite
set wildmode=longest,list

" set guioptions-=m
set guioptions-=T
colorscheme codedark


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

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.pl,*.java,*.v,*.sv,makefile exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call SetCommentShAndMake()
        call setline(8,"\#!/bin/bash")
        call setline(9,"")

    elseif &filetype == 'perl'
        call setline(1,"\#!/usr/bin/perl")
        call setline(2,"")

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
" for windows terminal cursor shape setting
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
