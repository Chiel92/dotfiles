"set shell=/bin/bash
"
" *** VUNDLE CONFIGURATION ***
"

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" *******************************************************
" *********************   VIMIDE   **********************
" ********************  collection  *********************
" *******************                ********************
" Syntax checker support
Plugin 'scrooloose/syntastic'
" Advanced on the fly autocompletion
"Plugin 'Valloric/YouCompleteMe'
" Class browser
Plugin 'majutsushi/tagbar'
" Filetree browser
Plugin 'scrooloose/nerdtree'
" Autoformatting support
Plugin 'Chiel92/vim-autoformat'
" Snippet support
if has("gui_running")
    Plugin 'SirVer/ultisnips'
endif
Plugin 'honza/vim-snippets'
" Easy motion
Plugin 'easymotion/vim-easymotion'
" Buffer explorer
Plugin 'corntrace/bufexplorer'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-sensible'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
" Fuzzy File Finder
"Plugin 'kien/ctrlp.vim'
" Automatic tag file generator
"Plugin 'xolox/vim-easytags'
"Plugin 'tpope/vim-sleuth'
" *******************                ********************
" ********************  collection  *********************
" *********************   VIMIDE   **********************
" *******************************************************
"
" Integrated debugger
"Plugin 'jabapyth/vim-debug'
" Matchit
Plugin 'edsono/vim-matchit'
" Surround
Plugin 'tpope/vim-surround'
" Extend repeat command functionality
Plugin 'tpope/vim-repeat'
" Gitwrapper
Plugin 'tpope/vim-fugitive'
" Autoformatting for javascript
Plugin 'einars/js-beautify'
" Solarized colorscheme for vim
Plugin 'altercation/vim-colors-solarized'
" NERDCommenter
Plugin 'scrooloose/nerdcommenter'
" Better HTML5 support
Plugin 'othree/html5.vim'
" Coffee script support
Plugin 'kchmck/vim-coffee-script'
" Tabularizing
Plugin 'godlygeek/tabular'
" Colors
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
Plugin 'kien/rainbow_parentheses.vim'
" Cython
Plugin 'tshirtman/vim-cython'
" TypeScript
Plugin 'leafgarland/typescript-vim'
" OrgMode
Plugin 'jceb/vim-orgmode'
" Better f/t
Plugin 'dahu/vim-fanfingtastic'
call vundle#end()             " required
filetype plugin indent on     " required

"
" *** OTHER CONFIGURATION ***
"


set number          " Absolute line numbering on current line
set undofile        " Remember undo history
set undodir=$HOME/.vimundo/ " set a directory to store the undo history
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set hlsearch        " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)
set lazyredraw      " Don't update the display while executing macros
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " Makes CtrlP faster
set gdefault        " auto g flag for substitution
syntax on
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set list

let mapleader = ","

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

:command! RemoveTrailingSpaces %s/\s\+$


" Easy motion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1


"Disable annoying help
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
vnoremap <F1> <Esc>
"Open bufferexplorer
noremap <F2> :BufExplorer<CR>
"Autoformat code
noremap <F3> :Autoformat<CR>
"Compile
"noremap <F5> :<C-U>silent make<CR>:redraw!<CR>
nnoremap <F5> :w<CR>:make<CR>:redraw!<CR>
" Decent save shortcut
nnoremap <C-s> :w<CR>
" Disable ex mode, it's useless and annoying. Map Q to format instead.
nnoremap Q gq
" Let's make it easy to edit this file
nmap <silent> ,ev :e $MYVIMRC<cr>
" And to source this file as well
nmap <silent> ,sv :so $MYVIMRC<cr>
" Easily use YCM's goto definition command
nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Give Y a sane meaning
nnoremap Y y$

let g:UltiSnipsExpandTrigger="<c-j>"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1 "Not working ??
let g:ycm_filetype_blacklist = {}
let g:ycm_confirm_extra_conf = 0

let g:ycm_csharp_server_stdout_logfile_format = "~/omnisharp_stdout_log_{port}"
let g:ycm_csharp_server_stderr_logfile_format = "~/omnisharp_stderr_log_{port}"
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Easytags shouldn't show updatetime warning
let g:easytags_updatetime_warn = 0

" Color settings
set background=dark
"colorscheme solarized
"set t_Co=256

"Some settings for the GUI
if has("gui_running")
    "disable scrollbars
    set guioptions+=LlRrb
    set guioptions-=LlRrb
    "remove toolbar
    set guioptions-=T
    "remove menu
    set guioptions-=m
    "Disable all cursor blinking:
    set guicursor+=a:blinkon0
    colorscheme base16-ashes
    " Convenient fontsize
    set guifont=consolas:h11
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"autocmd InsertLeave,TextChanged * if expand('%') != '' | Autoformat | endif
"autocmd InsertLeave,TextChanged * Autoformat

"
" FILETYPE SPECIFIC STUFF
"
set autoindent
set nocindent
set nosmartindent

autocmd BufRead,BufNewFile *.ma set filetype=ma

"let g:formatterpath = ['/home/chiel/formatters']
"let g:formatdef_greeter = '"echo hello"'
"let g:formatters_text = ['greeter']

autocmd BufRead,BufNewFile *.go set filetype=go

autocmd BufWrite *.js :Autoformat
"let g:autoformat_verbosemode = 1
"let g:formatprg_args_expr_javascript = '"-".(&expandtab ? "s ".&shiftwidth : "t").(&textwidth ? " -w ".&textwidth : "")." -"'
let g:formatdef_test = '"asdf"'
let g:formatdef_another_autopep8 = '"autopep8 - --indent-size 2 ".(&textwidth ? "--max-line-length=".&textwidth : "")'



au FileType haskell nnoremap <buffer> <F3> :Tab /^[^=]*\zs=<CR>
au FileType haskell nnoremap <buffer> <F5> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F6> :HdevtoolsClear<CR>
au FileType haskell set shiftwidth=2

au FileType cs compiler xbuild

autocmd BufRead,BufNewFile *.sage set filetype=python
autocmd BufRead,BufNewFile *.sage set makeprg=sage\ --preparse\ %

"au FileType python set textwidth=95
au FileType markdown set textwidth=95

au FileType coffee setl shiftwidth=2

autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType tex set makeprg=pdflatex\ %
autocmd FileType tex set indentexpr=
autocmd FileType tex set indentkeys=
autocmd FileType tex nnoremap <F6> :!bash compile.sh<cr><cr>

let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['coffee'] }
let g:syntastic_python_python_exec = 'python3'

let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'

let g:NERDCustomDelimiters = {
            \ 'html': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
            \ 'xhtml': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/'},
            \ 'ma': { 'left': '#' }
            \}
let NERD_html_alt_style=1
