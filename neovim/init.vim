
"""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""

" general config
syntax on
set number
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set cursorline
set clipboard=unnamedplus
set shortmess+=c
let g:coc_disable_startup_warning = 1

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
nnoremap <leader>W :wq<cr>

" map quit to leader q
nnoremap <leader>q :q<cr> 

" map nohlsearch to leader *
nnoremap <leader>* :noh<cr>

" nerdtree toggle
nnoremap <leader>N :NERDTreeToggle<cr>

" fzf toggle for current directory and home directory
nnoremap <leader>f :FZF<cr>
nnoremap <leader>F :FZF ~<cr>

" edit coc snippets
nnoremap <leader>a :CocCommand snippets.editSnippets<cr>

" split and terminal mappings
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>T :terminal<cr>
nnoremap <leader>t :$tabnew<cr>
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>t5 :-tabmove<cr>
nnoremap <leader>t6 :+tabmove<cr>
tnoremap <Esc> <C-\><C-n>

" sort
nnoremap <leader>u :%!sort -u<cr>
nnoremap <leader>i :%!sort -u --version-sort<cr>

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

" coc completion/snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" commenter
Plug 'preservim/nerdcommenter'

" pairing
Plug 'jiangmiao/auto-pairs'

" surround mappings for easy surrounding pairs editing
Plug 'tpope/vim-surround'

" color css
Plug 'ap/vim-css-color'

" fzf fuzzy finding search using ag 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
let $FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'

" init plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""
" COC CONFIG 
"""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ 'coc-pyright',
  \ 'coc-clangd',
  \ 'coc-sql',
  \ 'coc-html',
  \ 'coc-phpactor',
  \ 'coc-xml',
  \ 'coc-css',
  \ 'coc-sh',
  \ 'coc-go'
  \ ]

set hidden 
set updatetime=300
set signcolumn=yes

" use tab for trigger completion with characters ahead and navigate plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

