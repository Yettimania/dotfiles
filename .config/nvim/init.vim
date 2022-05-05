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
Plug 'fcpg/vim-farout'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'davidhalter/jedi-vim'
Plug 'HansPinckaers/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'preservim/tagbar'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'alaviss/nim.nvim'
call plug#end()

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c

"make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

" Disable Jedi-vim autocompletion and enable call-sg options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = 2

" Tagbar Tobble
nmap <F9> :TagbarToggle<CR>

" Snippet seetings
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" set background=dark
" colorscheme koehler
" colorscheme molokai
colorscheme gruvbox
" colorscheme tokyonight
" colorscheme farout


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
autocmd FileType python map <C-c> :s/^/# /<CR>
autocmd FileType python map <C-u> :s/^# //<CR>

autocmd FileType go map <C-c> :s/^/\/\/ /<CR>
autocmd FileType go map <C-u> :s/^\/\/ //<CR>

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

" fzf single key map
map <;> :Files<CR>
