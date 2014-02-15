" Vundle Settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""
" Bundles "
"""""""""""
Bundle "gmarik/vundle"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-repeat"
Bundle "Lokaltog/vim-powerline"
Bundle "Lokaltog/vim-easymotion"
Bundle "vlasar/snipmate"
Bundle "vlasar/snipmate-snippets"
Bundle "thisivan/vim-bufexplorer"
Bundle "gregsexton/MatchTag"
Bundle "altercation/vim-colors-solarized"
Bundle "kchmck/vim-coffee-script"
Bundle "airblade/vim-gitgutter"
Bundle "kien/ctrlp.vim"
Bundle "elixir-lang/vim-elixir"
Bundle "jnurmine/Zenburn"

filetype plugin indent on

runtime! bundle/snipmate-snippets/support_functions.vim

autocmd BufWritePre * :%s/\s\+$//e

set title
set hidden

" Numbers
set number
set numberwidth=4
set ruler

exe "set path=".expand("$PATH")

syntax enable

set nomodeline
set backspace=indent,eol,start                          " Backspace will delete EOL chars, as well as indents
set matchpairs+=<:>                                     " For characters that forms pairs for using % commands, this is for HTML Tags
set shortmess=atToOI                                    " To avoid the 'Hit Enter' prompts caused by the file messages
set iskeyword+=_,$,@,%,#                                " Keywords are use to searching and recognized with many commands
set history=1000
set undolevels=1000
set confirm
set updatetime=1500

" Encoding "
set encoding=utf-8
set termencoding=utf-8

" Instantly leave insert mode when pressing <ESC>"
" This works by disabling the mapping timeout completely in normal
" mode, and enabling it in insert mode with a very low timeout length.
augroup fastescape
	autocmd!

	set notimeout
	set ttimeout
	set timeoutlen=10

	au InsertEnter * set timeout
	au InsertLeave * set notimeout
augroup END

" CTRL P
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|deps|_build$'

" Define , as map leader"
let mapleader = ' '
let g:mapleader = ' '

" Disable all bells"
set noerrorbells visualbell t_vb=

" Wild menu (Autocompletion)"
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif
set wildmode=full

" Backup and Swap"
set nobackup
set nowritebackup
set noswapfile

" Search Options"
set hlsearch   " Highlight search
set incsearch  " Incremental search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

" FOLDING
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

" Ack vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Look and Feel settings
" set background=dark
set t_Co=256
colorscheme zenburn

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" General UI Options"
set laststatus=2       " Always show the statusline

set showmatch          " Shows matching brackets when text indicator is over them
set scrolloff=5        " Show 5 lines of context around the cursor
set sidescrolloff=20
set lazyredraw         " The screen won't be redrawn unless actions took place
set cursorline
set scrolljump=10
set showcmd
set ttyfast            " Improves redrawing for newer computers
set pumheight=10
set diffopt+=context:3
set nostartofline      " when moving thru the lines, the cursor will try to stay in the previous columns

" LAYOUT / TEXT FORMATTING
" Formatting Options
set wrap	" Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak " It maintains the whole words when wrapping

" Indentation"
set autoindent
set cindent
set smartindent

" Tab Options"
set shiftwidth=2
set tabstop=2
set expandtab

" MAPPINGS

" General
	" Clear search highlighting
  nnoremap <silent><leader>c :nohlsearch<CR>

  " Start BufExplorer
  nnoremap <silent><leader>l :BufExplorer<CR>
  nnoremap <silent><leader>s :A<CR>
  nnoremap <silent><leader>v :AV<CR>
  nnoremap <silent><leader>\ :vs<CR>
  nnoremap <silent><leader>- :split<CR>
  nnoremap <silent><leader>1 :e ~/.vimrc<CR>
  nnoremap <silent><leader>2 :source ~/.vimrc<CR>

  nnoremap <silent><leader>r :!rspec %<CR>
  nnoremap <silent><leader>w :wa<CR>
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  command W w
  command Q q
  command Wq wq

  " Elixir specific
  nnoremap <leader>t :!mix test --trace<CR>
  nnoremap <leader>f :!mix test --trace %<CR>



  " Paste
  let paste_mode = 0 " 0 = normal, 1 = paste

  func! Paste_on_off()
    if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
    else
      set nopaste
      let g:paste_mode = 0
    endif
    return
  endfunc

  " Paste Mode <F3>
  nnoremap <silent> <F3> :call Paste_on_off()<CR>
  set pastetoggle=<F3>

	" Repurpose left and right arrow keys to move between the buffers
	nnoremap <silent> <Down>   :bn<CR>
	nnoremap <silent> <Up>  :bp<CR>

	" Indent visual selected code without unselecting
	" As seen in vimcasts.org
	vmap > >gv
	vmap < <gv
	vmap = =gv

" GO

au BufRead,BufNewFile *.go set filetype=go

" 3RD-PARTY PLUGINS SETTINGS

  " Buffer Explorer
  let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

  set wildignore+=vendor/**

  " Vim Git Gutter
  highlight SignColumn ctermbg=none
  let g:gitgutter_signs = 1         " Activate gutter signs


