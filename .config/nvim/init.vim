let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.CONFIG}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'morhetz/gruvbox'
Plug 'preservim/tagbar'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanolsonx/vim-xit'
Plug 'NoahTheDuke/vim-just'
Plug 'synaptiko/xit.nvim' 
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdcommenter'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
"
" Tagbar Tobble
nmap <F9> :TagbarToggle<CR>

" Snippet seetings
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Vim Slime
let g:slime_target = "zellij"
let g:slime_default_config = {"session_id": "current", "relative_pane": "right"}

" color shceme
colorscheme gruvbox

" Set airline theme
let g:airline_theme='gruvbox'

" show line numbers
" set number
set rnu

" needed for light line
set laststatus=2

set hidden
set mouse=a
set noshowmode
set nolazyredraw

" set tabs to have 4 spaces
set ts=4
set shiftwidth=4

" indent when moving to the next line while writing code
set ai "Auto indent
set si "Smart indent
set wrap "Wrap Lines

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair of [] {} and ()
set showmatch

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Toggle mapping for NERDTree
map <F1> :NERDTreeToggle<CR>

" FZF single key map
map <C-f> :FZF<CR>

" Use external clipboard
set clipboard=unnamed

" Syntastic Extension
let python_highlight_all=1
syntax on
syntax enable

" Autoformat
noremap <F3> :Autoformat<CR>

" Search configuration
set ignorecase
set smartcase

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Commenting on various languagues
" autocmd FileType python map <C-c> :s/^/# /<CR>
" autocmd FileType python map <C-u> :s/^# //<CR>
" 
" autocmd FileType julia map <C-c> :s/^/# /<CR>
" autocmd FileType julia map <C-u> :s/^# //<CR>
" 
" autocmd FileType go map <C-c> :s/^/\/\/ /<CR>
" autocmd FileType go map <C-u> :s/^\/\/ //<CR>

" Debugger
function! NvimGdbNoTKeymaps()
  tnoremap <silent> <buffer> <esc> <c-\><c-n>
endfunction

let g:nvimgdb_config_override = {
  \ 'key_next': 'n',
  \ 'key_step': 's',
  \ 'key_finish': 'f',
  \ 'key_continue': 'c',
  \ 'key_until': 'u',
  \ 'key_breakpoint': 'b',
  \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
  \ }

" Set language
map <C-s> :set spell spelllang=en_us<enter>
map <C-n> :set nospell<enter>
