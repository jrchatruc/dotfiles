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
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'tomasiser/vim-code-dark'
  Plug 'elixir-editors/vim-elixir'
  Plug 'APZelos/blamer.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'slashmili/alchemist.vim'
  Plug 'rhysd/vim-clang-format'
call plug#end()

let g:neovide_fullscreen=v:true
let g:neovide_remember_window_size = v:true
let g:neovide_cursor_animation_length=0

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

" -------------- RUST STUFF ----------------"

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
