set smartindent         " Indent following line in e.g function def.
set autoindent          " Indent following line to same as previous
set hlsearch            " Highlight search results
set ignorecase          " Case-insensitive searching
set smartcase           " ...unless search contains upper case chars
set textwidth=79        " Wrap lines after 79 characters
set linebreak           " Wrap lines between words
set tabstop=4           " Number of spaces to indent tabs
set shiftwidth=4        " Number of spaces to autoindent
set shiftround          " Shift to the next indentation level
set expandtab           " Insert spaces instead of tabs
set mouse=a             " Enable mouse support
set encoding=utf-8
set fileformat=unix
set spelllang=en_gb

" Solarized light color scheme
set background=light
colorscheme solarized

" Use a space instead of a pipe in between vertical splits
set fillchars+=vert:\ 

highlight TrailingWhitespace ctermbg=darkgreen guibg=lightgreen
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

autocmd FileType gitcommit setlocal tw=72 spell
autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab ts=8 sw=8

if exists("&colorcolumn")
    set colorcolumn=+1
    highlight ColorColumn ctermbg=grey guibg=grey
else
    match ErrorMsg '\%>80v.\+'
endif

if has("gui_running")
    set columns=90
    set lines=46
    set guioptions-=T
    if has("gui_gtk2")
        set guifont=DejaVu\ Sans\ Mono\ 9,Monospace\ 9
    elseif has("gui_win32")
        set guifont=Consolas:h9
    endif
endif

let mapleader=" "
let maplocalleader=","
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
