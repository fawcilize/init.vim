" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-distinguished'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'ernstvanderlinden/vim-coldfusion'

call plug#end()

" Color Scheme
set t_Co=256
syntax on
set background=dark
colorscheme distinguished

" Plugins
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

nnoremap <C-p> :FZF<CR>

let $FZF_DEFAULT_COMMAND='fd --type=f --hidden --follow'

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:30%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let NERDTreeShowBookmarks=0
let NERDTreeHighlightCursorline=1
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2
let NERDTreeHijackNetrw=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Other
syntax enable
set cursorline
set showmatch
set splitbelow splitright
set title
set wildmenu
set wildchar=<TAB>
set wildmode=list:longest
set ignorecase
set smartcase
set autoindent smartindent
set copyindent
set ruler
set confirm
set visualbell
set cmdheight=2
set number
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab
set smarttab
set wrap
set textwidth=80
set mouse=a
set listchars=tab:..,trail:-,extends:>,precedes:<,nbsp:~
set list

set matchpairs+=<:>

nnoremap j gj
nnoremap k gk

command! W w
command! Wq wq

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermbg=Cyan ctermfg=Black
  elseif a:mode == 'r'
    hi statusline ctermbg=Purple ctermfg=Black
  else
    hi statusline ctermbg=Blue ctermfg=Black
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermbg=Blue ctermfg=Black

hi statusline ctermbg=Blue ctermfg=Black
hi statuslinenc ctermbg=17 ctermfg=White
hi Whitespace ctermfg=240

set statusline=%f
set statusline+=\ %=
set statusline+=Line:%l/%L[%p%%]
set statusline+=\ Column:%c

