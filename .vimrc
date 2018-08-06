"
" plugin
"

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'mhartington/oceanic-next'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

Plug 'rhysd/vim-clang-format'

Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'bitc/vim-bad-whitespace'
Plug 'davidhalter/jedi-vim'
Plug 'tell-k/vim-autopep8'

Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'Quramy/tsuquyomi'

Plug 'https://gitlab.com/betseg/vim-dcrpc.git'

call plug#end()

"
" theme
"

syntax enable
set laststatus=2
colorscheme OceanicNext

"
" editor
"

set tabstop=4
set shiftwidth=0

set backspace=indent,eol,start
set undodir=~/.vim/undo-dir
set undofile
set splitright
set number
set encoding=utf-8
imap jk <Esc>

"
" navigation
"

nmap gr :Files<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :NERDTreeFind<CR>

nmap <F9> :TagbarToggle<CR>

"
" code
"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "level": "warnings" }

set completeopt-=preview

nmap <C-i> <plug>NERDCommenterToggle<CR>
vmap <C-i> <plug>NERDCommenterToggle<CR>gv

"
" language specific
"

" go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_def_mode = "guru"
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:tagbar_type_go = {
			\ 'ctagstype': 'go',
			\ 'kinds' : [
			\'p:package',
			\'f:function',
			\'v:variables',
			\'t:type',
			\'c:const'
			\]
			\}


" c
autocmd FileType c,cpp,objc :ClangFormatAutoEnable
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

" python
autocmd Filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 autoindent
autocmd FileType python :ShowBadWhitespace
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
au BufNewFile *.py 0r ~/.vim/py.header.template
let python_highlight_all=1
let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" typescript
autocmd Filetype typescript setlocal expandtab autoindent tabstop=2 smartindent cindent
autocmd Filetype typescript nmap gd :TsuDefinition<CR>
let g:syntastic_typescript_checkers = ['tslint --type-check', 'tsc']
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:tagbar_type_typescript = {
			\ 'ctagsbin' : 'tstags',
			\ 'ctagsargs' : '-f-',
			\ 'kinds': [
			\ 'e:enums:0:1',
			\ 'f:function:0:1',
			\ 't:typealias:0:1',
			\ 'M:Module:0:1',
			\ 'I:import:0:1',
			\ 'i:interface:0:1',
			\ 'C:class:0:1',
			\ 'm:method:0:1',
			\ 'p:property:0:1',
			\ 'v:variable:0:1',
			\ 'c:const:0:1',
			\ ],
			\ 'sort' : 0
			\ }

" text
autocmd Filetype html setlocal expandtab autoindent tabstop=2 smartindent cindent
autocmd Filetype json setlocal expandtab autoindent tabstop=2 smartindent cindent
autocmd Filetype yaml setlocal expandtab autoindent tabstop=2 smartindent cindent
autocmd Filetype groovy setlocal expandtab autoindent tabstop=2 smartindent cindent

"
" etc
"

let g:dcrpc_autostart = 1
