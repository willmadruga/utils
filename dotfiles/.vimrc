execute pathogen#infect()

" #############
" Set Options #################################################################################
" #############

syntax on
syntax enable
filetype plugin indent on

set nocompatible

set listchars=tab:▸\ ,eol:¬
set relativenumber
set number
set ignorecase
set hlsearch
set title
set visualbell
set noerrorbells
set cursorline
set expandtab

set tabstop=2
set shiftwidth=2
set shiftwidth=2
set history=1000
set undolevels=1000
set spelllang=en_ca

set path+=**
set wildmenu


" ################
" Plugins Config #############################################################################
" ################

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeMapOpenInTab='<SHIFT>T'
map <C-\> :NERDTreeToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_jslint_checkers=['jslint']

" ################
" Remapping keys ############################################################################
" ################

" switches to 'paste mode' to disable auto-indenting and other things when you paste content
" You can use <C-r>+ to paste right from the OS paste board
set pastetoggle=<F2>

" remaps leader from backslash to comma
let mapleader=","

" GoTo buffer remap
nnoremap gb :ls<CR>:b<Space>

" Show invisible characters (tabs and EOF)
nmap <leader>l :set list!<CR>

" remaps [:] to [;]
nnoremap ; :

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Turn search highlight off
nmap <silent> <leader>/ :nohlsearch<CR>

" Open Tag in new Tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" Copy whole file to clipboard (requires vim-x11)
noremap <leader>y :%y+<CR> 

" Spell check
nnoremap <leader>s :set spell!<CR>

" ##########
" Commands #################################################################################
" ##########
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules --exclude=coverage --exclude=.nyc_output
command! Grunt !grunt

" ##########
" Snippets ################################################################################
" ##########

" Javascript - General
nnoremap <leader>fn :-1read $HOME/.vim/snippets/function.js<CR>wi

" SuiteScript 2.0 - Script files
nnoremap <leader>nsbis :-1read $HOME/.vim/snippets/NS_BundleInstallationScript.js<CR>
nnoremap <leader>nsue :-1read $HOME/.vim/snippets/NS_UserEventScript.js<CR>
nnoremap <leader>nswa :-1read $HOME/.vim/snippets/NS_WorkflowActionScript.js<CR>
nnoremap <leader>nsmr :-1read $HOME/.vim/snippets/NS_MapReduceScript.js<CR>
nnoremap <leader>nsmu :-1read $HOME/.vim/snippets/NS_MassUpdateScript.js<CR>
nnoremap <leader>nspl :-1read $HOME/.vim/snippets/NS_Portlet.js<CR>
nnoremap <leader>nsrl :-1read $HOME/.vim/snippets/NS_RESTLet.js<CR>
nnoremap <leader>nsss :-1read $HOME/.vim/snippets/NS_ScheduledScript.js<CR>
nnoremap <leader>nssl :-1read $HOME/.vim/snippets/NS_Suitelet.js<CR>
nnoremap <leader>nscs :-1read $HOME/.vim/snippets/NS_ClientScript.js<CR>

" SuiteScript 2.0 - Snippets

