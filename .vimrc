"first handle plugins with Vundle
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/c.vim'

"Sir Tim Pope
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

Plugin 'jiangmiao/auto-pairs'
Plugin 'bdauria/angular-cli.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'joaohkfaria/vim-jest-snippets'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

Plugin 'elzr/vim-json'
Plugin 'ctrlpvim/ctrlp.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" MarkDown stuff
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1



"
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-m>"
:let g:html_indent_inctags = "html,body,head,tbody"


" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" "

Plugin 'gavocanov/vim-js-indent'           
Plugin 'jelera/vim-javascript-syntax'      
Plugin 'Quramy/vim-js-pretty-template'     
Plugin 'leafgarland/typescript-vim'        
Plugin 'rust-lang/rust.vim'                
Plugin 'timonv/vim-cargo'                  
Plugin 'metakirby5/codi.vim'               
Plugin 'skywind3000/asyncrun.vim'          
Plugin 'altercation/vim-colors-solarized'  
Plugin 'vim-scripts/SyntaxRange'           
Plugin 'tybenz/vimdeck'                    
Plugin 'alvan/vim-closetag'                
Plugin 'Shougo/vimproc.vim'                
Plugin 'Quramy/tsuquyomi'                  
call vundle#end()

"who knows; make sure this is after vundle#end
filetype plugin indent on
filetype plugin on

"and whatever pathogen stuff there is to run
execute pathogen#infect()

"use relativenumber and number
set relativenumber
set number

"toggle NERDTree off
nnoremap <Leader>l :NERDTreeToggle<CR>

" eslinter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"syntax checking
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
syntax enable

"set indent and tab stuff
set shiftwidth=2
set tabstop=2
set expandtab

"ruler line and history
set history=50
set ruler
set showcmd
set incsearch

"eh old thing
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set nohlsearch
endif

colorscheme default

"don't clutter everything up with .swp
set noswapfile


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

" For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

"no clue
set laststatus=2
set cursorline

"scroll before hitting last line of buffer
set scrolloff=5
set encoding=utf-8

"favorite: jj is used to toggle normal mode
inoremap jj <Esc>
noremap : <;> 
noremap ; :

" Maps autocomplete to tab //not sure why i wanted this
"imap <Tab> <C-P>

"typescript stuff and markup
autocmd FileType typescript JsPreTmpl html js

" jsx
let g:jsx_ext_required = 0

