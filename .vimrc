"-------------------------------------------
" .vimrc {{{
"-------------------------------------------

" configs {{{
set encoding=utf-8
scriptencoding utf-8

set nocompatible
set hidden
set nospell
set backspace=indent,eol,start
set autoindent
set autowrite
set autoread
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set cursorline
set ruler
set smarttab
set wildmenu wildoptions=pum
set wildmenu wildmode=longest:full,full
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
" set scrolloff=999
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmatch
set hlsearch
set timeoutlen=500
set history=5000
" set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set clipboard=unnamedplus
set shortmess+=I
set nofoldenable
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endi
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
set showbreak=\\
set list
set autochdir
" }}}

" autocmd {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

augroup markdown
    autocmd!
    autocmd BufEnter *.md :nnoremap <leader><leader>vm :norm VA$<cr>:!latexindent<cr>:w<cr>
    autocmd BufEnter *.md :let @q='vi$:s/\%V //g:nohljk``'
    autocmd BufEnter *.md :let @t='jkI\msjk'
    autocmd BufEnter *.md :let @i='I\cimg{5cm}{}AOD'
    autocmd BufEnter *.md :let @o='I\bw{r}{5cm}A\ew0'
    autocmd BufEnter *.md :let @p='i\vspace{-1cm}hhhh'
    autocmd BufEnter *.md :let @e='jkA[3~ jk'
    autocmd BufEnter *.md :let g:fzf_vim.tags_command = 'ctags -uR *.md'
    autocmd BufEnter *.md :ab darr \def\arraystretch{2}
    autocmd BufEnter *.md :ab barr \begin{array}{rcl}
    autocmd BufEnter *.md :ab earr \end{array}
    autocmd BufWritePre *.md :Neoformat
augroup END
" }}}

" mappings {{{
nnoremap <down> gj
nnoremap <up>   gk
nnoremap d      "_d
nnoremap c      "_c
nnoremap <del>  "_x
nnoremap dd     "_dd
inoremap jk     <esc>
inoremap JK     <esc>

let mapleader = " "
let g:mapleader = " "
let maplocalleader = ","
let g:maplocalleader = ","

nnoremap <silent> <leader>e          :e .<cr>
nnoremap <silent> <leader>n          :bn<cr>
nnoremap <silent> <leader>w          :w!<CR>
nnoremap <silent> <leader>q          :q<CR>
nnoremap <silent> <leader><ESC><ESC> :qa!<CR>
nnoremap <silent> <leader>m          :w<cr>:make<cr>
nnoremap <silent> <leader>x          :bd!<cr>
nnoremap <silent> <leader>t          :bot term<CR><C-W>N:res 10<cr>i
nnoremap <silent> <C-l>              :nohlsearch<CR>

nnoremap <silent> <leader>v          :aboveleft<CR>:vs<CR><C-W><C-W>:enew<cr>
nnoremap <silent> <leader>h          :botrigh<CR>:split<CR><C-W><C-W>:enew<cr>
nnoremap <silent> <leader>c          :close<CR>
nnoremap <silent> <leader><leader>,  5<C-W><
nnoremap <silent> <leader><leader>.  5<C-W>>
nnoremap <silent> <leader><leader>j  5<C-W>-
nnoremap <silent> <leader><leader>k  5<C-W>+

nnoremap <silent> <leader>z          :set wrap!<CR>

""" Move lines
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-k>               :call <SID>swap_up()<CR>
noremap <silent> <c-j>               :call <SID>swap_down()<CR>
vnoremap <silent> <C-k>              :m '<-2<CR>gv
vnoremap <silent> <C-j>              :m '>+1<CR>gv

""" Some stuff
nnoremap <silent> <localleader>v     :edit   $MYVIMRC<CR>
nnoremap <silent> <localleader>u     :source $MYVIMRC<CR>
nnoremap <leader>s                   :%s/
nnoremap <leader>r                   :%s/<C-r><C-w>//g<Left><Left>
nnoremap <silent> <leader>af         :Autoformat<CR>
nnoremap <silent> <leader>f          :Neoformat<CR>

nnoremap <silent> <leader><leader>b  :Buffers<cr>
nnoremap <silent> <leader><leader>f  :Files<CR>
nnoremap <silent> <leader><leader>m  :FZFMru<cr>
nnoremap <silent> <leader><leader>l  :Lines<cr>
" }}}

" plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif

call plug#begin()
" Plug 'dense-analysis/ale'
Plug 'ap/vim-css-color'
Plug 'arecarn/crunch.vim'
Plug 'arecarn/vim-selection'
Plug 'chrisbra/csv.vim'
Plug 'dohsimpson/vim-macroeditor'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'lervag/vimtex'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-autoformat/vim-autoformat'
Plug 'wellle/targets.vim'
Plug 'yegappan/mru'
Plug 'ayu-theme/ayu-vim'
call plug#end()
" }}}

" plugins configs {{{

""" Colorscheme {{{
set t_Co=256
set termguicolors
try
    " let ayucolor="light"  " for light version of theme
    " let ayucolor="mirage" " for mirage version of theme
    let ayucolor="dark"   " for dark version of theme
    colorscheme ayu
    " colorscheme retrobox
catch
    colorscheme default
endtr
" }}}

""" Config for lightline {{{
set laststatus=2
set background=dark
set noshowmode
" }}}

""" Config for Tcomment {{{
nnoremap <silent> <leader>/ :TComment<CR>
vnoremap <silent> <leader>/ :TComment<CR>
" }}}

""" Config for markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}

""" Config for ALE {{{
" let g:ale_fixers = {
"             \   'markdown': ['prettier'],
"             \   'python': ['black'],
"             \}
"
" let g:ale_linters = {
"             \   'markdown': ['markdownlint'],
"             \   'python': ['pylint'],
"             \}
"
" let g:ale_python_pylint_options = '--disable=C0114,C0116'
" let g:ale_fix_on_save = 1
" }}}

""" Config for Coc {{{
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

""" Config for fzf.vim {{{
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
let g:fzf_vim.tags_command = 'ctags -R'
" }}}


""" Config for vimtex {{{
let g:vimtex_compiler_latexmk = {
            \ 'aux_dir' : '',
            \ 'out_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

let g:vimtex_compiler_latexmk_engines = {
            \ '_'                : '-pdf',
            \ 'pdfdvi'           : '-pdfdvi',
            \ 'pdfps'            : '-pdfps',
            \ 'pdflatex'         : '-pdf',
            \ 'luatex'           : '-lualatex',
            \ 'lualatex'         : '-lualatex',
            \ 'xelatex'          : '-xelatex',
            \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
            \ 'context (luatex)' : '-pdf -pdflatex=context',
            \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
            \}

let g:vimtex_view_general_viewer = 'zathura'

" }}}

" }}}

" }}}

" End of file
" vim: set ft=vim :
