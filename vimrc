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
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"
Bundle "Lokaltog/vim-powerline"
Bundle "Lokaltog/vim-easymotion"
Bundle "Shougo/neocomplcache"
Bundle "vlasar/snipmate"
Bundle "vlasar/snipmate-snippets"
Bundle "fholgado/minibufexpl.vim"
Bundle "mattn/gist-vim"
Bundle "godlygeek/tabular"
Bundle "majutsushi/tagbar"
Bundle "gregsexton/MatchTag"
Bundle "jelera/vim-gummybears-colorscheme"
Bundle "altercation/vim-colors-solarized"
Bundle "Townk/vim-autoclose"

filetype plugin indent on

runtime! bundle/snipmate-snippets/support_functions.vim

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

set mousehide                                           " Hide the mouse cursor when typing
set mouse=a

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

" Look and Feel settings
set background=dark
set t_Co=256
colorscheme jellybeans

" Display extra whitespace
set list listchars=tab:»·,trail:·

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

" 3RD-PARTY PLUGINS SETTINGS

  " neocomplcache"{{{

    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent><CR>  <C-R>=neocomplcache#smart_close_popup()<CR><CR>
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'"}}}

  " NERD tree"{{{
    let g:NERDTreeChristmasTree = 1
    let g:NERDTreeCaseSensitiveSort = 1
    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeWinPos = 'left'
    let g:NERDTreeWinSize = 50
    let g:NERDTreeShowBookmarks = 1
    map <F2> :NERDTreeToggle<CR>"}}}

  " MiniBufExpl"{{{
    let g:miniBufExplModSelTarget = 1
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplVSplit = 20
    let g:miniBufExplSplitBelow=1

    let g:bufExplorerSortBy = "name"

    nnoremap <silent> <Leader>l :MiniBufExplorer<CR>

    autocmd BufNew :call UMiniBufExplorer"}}}

    " Tagbar"{{{
    map <F4> :TagbarToggle<CR>"}}}
