set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'tpope/vim-rails.git'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'millermedeiros/vim-statline'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

" Some stock settings and flags
set autoindent " 자동으로 들여쓰기를 한다.
set cindent " C 프로그래밍을 할때 자동으로 들여쓰기를 한다.
set smartindent " 좀더 똑똑한 들여쓰기를 위한 옵션이다.
set wrap " 자동으로 를 삽입하여 다음 줄로 넘어간다.
set nowrapscan " 검색할 때 문서의 끝에서 다시 처음으로 돌아가지 않는다.
set nobackup " 백업 파일을 만들지 않는다.
set ruler " 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set tabstop=4 " Tab을 눌렀을 때 8칸 대신 4칸 이동하도록 한다.
set softtabstop=4
set shiftwidth=4 " 자동 들여쓰기를 할때 4칸 들여쓰도록 한다.
set expandtab
set hlsearch
set hidden

function! Linenum_Switch(mode)
    if a:mode == "n"     "none
        set nonumber
        set norelativenumber
    elseif a:mode == "a" "absolute
        set number
        set norelativenumber
    elseif a:mode == "r" "relative
        set number
        set relativenumber
    endif
endfunc

function! Linenum_SetMode(mode)
    let w:Linenum_mode = a:mode
    if a:mode == "n"
        let w:Linenum_alt = "n"
    elseif a:mode == "a"
        let w:Linenum_alt = "a"
    elseif a:mode == "r"
        let w:Linenum_alt = "a"
    endif
endfunc

" Relative Linenumber toggle.
function! Linenum_Toggle()
    if !exists('w:Linenum_mode') || w:Linenum_mode == "n"
        let Linenum_nextmode = "a"
    elseif w:Linenum_mode == "a"
        let Linenum_nextmode = "r"
    elseif w:Linenum_mode == "r"
        let Linenum_nextmode = "n"
    endif
    call Linenum_Switch(Linenum_nextmode)
    call Linenum_SetMode(Linenum_nextmode)
endfunc

function! Linenum_Auto(mode)
    if !exists('w:Linenum_mode')
        call Linenum_SetMode("r")
    endif

    if a:mode == "default"
        call Linenum_Switch(w:Linenum_mode)
    elseif a:mode == "alt"
        call Linenum_Switch(w:Linenum_alt)
    endif
endfunc

" C-n to toggle number.
nnoremap <C-n> :call Linenum_Toggle()<cr>
" Number-RelativeNumber auto toggle with corresponding focus status.
autocmd FocusLost * :call Linenum_Auto("alt")
autocmd FocusGained * :call Linenum_Auto("default")
autocmd WinLeave * :call Linenum_Auto("alt")
autocmd WinEnter * :call Linenum_Auto("default")

" Relative number mode on Navigate mode, Numbermode on Insert mode
autocmd InsertEnter * :call Linenum_Auto("alt")
autocmd InsertLeave * :call Linenum_Auto("default")

" easymotion leader setting
let mapleader = ","
map <Leader><Leader> <Plug>(easymotion-prefix)

" fast move between window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Insert new line without editing mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
