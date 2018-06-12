call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-syntastic/syntastic'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'Shougo/neocomplete.vim'
Plug 'mhartington/oceanic-next'

call plug#end()

set laststatus=2

map ; :Files<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-o> :NERDTreeFind<CR>
set splitright

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_quiet_messages = { "level": "warnings" }

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_def_mode = "guru"

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
set backspace=indent,eol,start
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
noremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
let g:neocomplete#sources#omni#functions = {'go': 'go#complete#Complete'}

set completeopt-=preview

imap jk <Esc>

set number
set ts=4
set shiftwidth=0
autocmd Filetype yaml setlocal tabstop=2

syntax enable
if (has("termguicolors"))
	set termguicolors
endif
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
