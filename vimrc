set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-rails.git'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
" replaced by auto-pairs due to compatibility with supertab
"Plugin 'Raimondi/delimitMate' 
Plugin 'jiangmiao/auto-pairs'
Plugin 'millermedeiros/vim-statline'
Plugin 'foriequal0/vim-autonumber'
"Plugin 'vim-scripts/OmniCppComplete'
"Plugin 'tomasr/molokai'
Plugin 'vim-scripts/Gundo'
" May be replaced with itchyny/lightline.vim
"Plugin 'bling/vim-airline' 
Plugin 'mhinz/vim-signify'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
"Plugin 'tfnico/vim-gradle'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'edkolev/tmuxline.vim'
"Plugin 'edkolev/promptline.vim'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

call vundle#end()
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
set nohlsearch
set hidden

" easymotion leader setting
let mapleader = ","
map <Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
omap s <Plug>(easymotion-bd-sl)
omap t <Plug>(easymotion-bd-tl)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1

inoremap jk <Esc>
inoremap kj <Esc>

" fast move between window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Insert new line without editing mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>                                        

" Gundo toggle
map <C-g> :GundoToggle<CR>

" ColorScheme
if &t_Co > 255
    "let g:molokai_original = 1
"    let g:molokai_original = 1
    let g:rehash256 = 1
"    colorscheme molokai
    hi ColorColumn ctermbg=8
else
    "fallback less than 256 color
    hi ColorColumn ctermbg=8
endif

" ColorColumn on 80, and over 120
let &colorcolumn="80,".join(range(120,999),",")

" DelimitMate <CR>, <Space> expansion
"let delimitMate_expand_space = 1
"let delimitMate_expand_cr = 2
"let g:SuperTabCrMapping = 0

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>

"
nmap <C-N> :NERDTreeToggle<CR>
