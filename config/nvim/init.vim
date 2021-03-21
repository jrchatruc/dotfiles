" Case insensitive search + highlight hits
set ic
set hlsearch

" Show line numbers
set number

" Enable clipboard
set clipboard+=unnamedplus

" Plugins
call plug#begin('~/.config/nvim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'tomasiser/vim-code-dark'
  Plug 'elixir-editors/vim-elixir'
  Plug 'APZelos/blamer.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'octol/vim-cpp-enhanced-highlight'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'slashmili/alchemist.vim'
  Plug 'rhysd/vim-clang-format'
call plug#end()

let g:deoplete#enable_at_startup = 1

" High update time for gitgutter
set updatetime=100

" VSCode dark+ color theme
colorscheme codedark

" Clang format style
let g:clang_format#code_style = 'google'

" Enable git blamer by default
let g:blamer_enabled = 1
syntax on

" Disable preview window for fzf
let g:fzf_preview_window = []

" Key remappings
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap W :w<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap S :%s/
nnoremap F <C-w>w

" Automatically close brackets/parentheses/etc
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Use tab to cycle through autocomplete suggestions
inoremap <expr> <TAB> pumvisible() ? "\<Up>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<Down>" : "\<TAB>"

" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

