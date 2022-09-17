set noswapfile
set hlsearch 
set ignorecase
set incsearch
set noerrorbells
set vb t_vb=
set number
set relativenumber
set nocompatible
set hidden
set nocp

colorscheme atom-dark

syntax on
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete

set ts=2
set sts=2
set sw=2
set expandtab

let mapleader = ","

:imap jk <Esc>
map <C-N> :NERDTreeToggle<CR>

map <leader>bp :bp<CR>
map <leader>bn :bn<CR>
map <leader>h :noh<CR>
map <leader>ff :Files<CR>
map <leader>n :set number! <CR>
map <leader>tt :FloatermToggle --autoclose=2<CR>
map <leader>r :set relativenumber! <CR>

nnoremap <silent> <Leader>f :Rg<CR>
 
" Use sed to figure out key codes
" ^[[1;3A option up arrow so ^[ = <ESC>
map <ESC>[1;3A :m-2<CR> 
map <ESC>[1;3B :m+<CR> 

" operating pending mapping like dp will delete inside parentheses
onoremap p i(

:autocmd FileType python     :iabbrev <buffer> iff if:<left>
:autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
:autocmd FileType javascript :iabbrev <buffer> }} {}<left><CR>

" Overrides
autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType bash setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType zsh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd BufNewFile,BufRead *.gitcommit setlocal filetype=gitcommit

let g:sneak#label = 1

" FZF options
set rtp+="${FZF_BASE}"
" let g:fzf_command_prefix = 'Fzf'

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview
"function.
" - To learn more about preview window options, see `--preview-window`
" section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
" let g:fzf_preview_window = []

let g:fzf_preview_window = 'right:40%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7  }  }

" Float Term
let g:floaterm_autoclose = 2
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = 'R'
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = 'ᛘ'


