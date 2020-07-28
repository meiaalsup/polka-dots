" Load up all the plugins
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deol.nvim'
Plug 'junegunn/vim-slash'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'"
" Colorschemes "
Plug 'mhartington/oceanic-next'
"
"Latex Plugins"
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'
"Autocomplete"
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

"Javascript beautify"
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()"

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
call plug#end()

syntax enable
filetype plugin indent on

colorscheme OceanicNext
"set background=dark

set shellcmdflag=-ic

set t_Co=256
if (has("termguicolors"))
    set termguicolors
endif

set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " for true colors


if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endifif &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set bs=2
set ts=4
set sw=4
set nocompatible
set history=9999
set incsearch
set matchtime=5
set showmatch
set wildmenu
set nu
set tags=./tags;/
set wrap
set linebreak
set nolist
set colorcolumn=80
set textwidth=80
set clipboard=unnamed

" Simple function to make it easier to toggle the background color
function BackgroundToggle()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction

nnoremap <C-S-k> ddkP
nnoremap <C-S-j> ddp
vnoremap <C-S-k> xkP`[V`]
vnoremap <C-S-j> xp`[V`]

nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <silent> <C-f> :BLines<CR>
map <silent> <C-n> :FZF!<CR>
map <silent> <F4> :call BackgroundToggle()<CR>
map <silent> <F12> :VimShell<CR>
map <F7> mzgg=G`z<CR>
map <silent> <ESC> :pclose<CR>:lclose<CR>

let g:airline_powerline_fonts = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=100'
let g:syntastic_quiet_messages = { "regex": [
  \ '\mpossible unwanted space at "{"',
  \ 'unmatched ',
  \ 'Do not use @ in LaTeX macro names',
  \ 'perhaps you should insert a ',
  \ 'to end quotation, not ` "mathcode`"',
  \ 'bad character in label ',
  \ 'ots should be ',
\ ] }

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'

" NCM2
augroup NCM2
  autocmd!
  " some other settings...
  " uncomment this block if you use vimtex for LaTex
  autocmd Filetype tex call ncm2#register_source({
            \ 'name': 'vimtex',
            \ 'priority': 8,
            \ 'scope': ['tex'],
            \ 'mark': 'tex',
            \ 'word_pattern': '\w+',
            \ 'complete_pattern': g:vimtex#re#ncm2,
            \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
            \ })
augroup END

autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
