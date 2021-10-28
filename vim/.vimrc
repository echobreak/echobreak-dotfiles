
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"_______/\/\____/\/\__/\/\/\/\__/\/\______/\/\__/\/\/\/\/\______/\/\/\/\/\_
"_______/\/\____/\/\____/\/\____/\/\/\__/\/\/\__/\/\____/\/\__/\/\_________
"_______/\/\____/\/\____/\/\____/\/\/\/\/\/\/\__/\/\/\/\/\____/\/\_________
"_/\/\____/\/\/\/\______/\/\____/\/\__/\__/\/\__/\/\__/\/\____/\/\_________
"_/\/\______/\/\______/\/\/\/\__/\/\______/\/\__/\/\____/\/\____/\/\/\/\/\_
"__________________________________________________________________________
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""

" theme settings
syntax on
colo gruvbox
set background=dark

" general config
set number
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set cursorline
set clipboard=unnamedplus

" powershell starting in replace mode fix
set t_u7=

"""""""""""""""""""""""""""""""""""""""""""
" MAPPING 
"""""""""""""""""""""""""""""""""""""""""""

" change leader key to space bar
nnoremap <SPACE> <Nop>
let mapleader=" "

" map split width to leader - =
" map split height to leader [ ]
nnoremap <leader>- :10winc < <cr>
nnoremap <leader>= :10winc > <cr>
nnoremap <leader>[ :5winc - <cr>
nnoremap <leader>] :5winc + <cr>

" map write to leader w
nnoremap <leader>w :w<cr>

" map nohlsearch to leader *
nnoremap <leader>* :noh<cr>

" nerdtree toggle
nnoremap <leader>n :NERDTreeToggle<cr>

" ale toggle
nnoremap <leader>a :ALEToggle<cr>

" fzf toggle for current directory and home directory
nnoremap <leader>f :FZF<cr>
nnoremap <leader>F :FZF ~<cr>

" :term to leader t
nnoremap <leader>t :term<cr>

"""""""""""""""""""""""""""""""""""""""""""
" STATUS BAR 
"""""""""""""""""""""""""""""""""""""""""""

" Clear status line when vimrc is reloaded
set statusline=

" Status line left side
set statusline+=\ %F\ %M\ %Y\ %R 

" Use a divider to separate the left side from the right side
set statusline+=%=

" Status line right side
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""

" vim-plug plugin manager
" plugin directory
call plug#begin('~/.vim/plugged')

" nerdtree file tree explorer
Plug 'preservim/nerdtree'
let g:NERDTreeShowHidden=1

" gruvbox color theme
" move ~/.vim/plugged/gruvbox/colors to ~/.vim
Plug 'morhetz/gruvbox'

" auto complete pop up menu
Plug 'vim-scripts/AutoComplPop'
set shortmess+=c
set completeopt=menuone,longest

" display colors in buffer 
Plug 'ap/vim-css-color'

" surround mappings for easy surrounding pairs editing
Plug 'tpope/vim-surround'

" emmet html snippet expansion
Plug 'mattn/emmet-vim'

" ale linting/lsp engine
Plug 'dense-analysis/ale'

" fzf fuzzy finding search using ag 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
let $FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'

" init plugin system
call plug#end()

