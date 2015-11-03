execute pathogen#infect()
execute pathogen#helptags()

filetype on
filetype indent on
filetype plugin on
syntax on

set nocompatible        " Disable Vi compatibility
set smartindent         " Indent following line in e.g function def.
set autoindent          " Indent following line to same as previous
set incsearch           " Search as you type
set hlsearch            " Highlight search results
set ignorecase          " Case-insensitive searching
set smartcase           " ...unless search contains upper case chars
set formatprg=par\ -w80 " Use par for formatting
set textwidth=79        " Wrap lines after 79 characters
set linebreak           " Wrap lines between words
set tabstop=4           " Number of spaces to indent tabs
set shiftwidth=4        " Number of spaces to autoindent
set expandtab           " Insert spaces instead of tabs
set encoding=utf-8
set fileformat=unix
set spelllang=en_gb

highlight TrailingWhitespace ctermbg=darkgreen guibg=lightgreen
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

autocmd FileType gitcommit setlocal tw=72 spell
autocmd FileType make setlocal noexpandtab

if exists("&colorcolumn")
    set colorcolumn=+1
    highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
else
    match ErrorMsg '\%>80v.\+'
endif

if has("gui_running")
    set columns=90
    set lines=46
    set guioptions-=T
    if has("gui_gtk2")
        set guifont=Inconsolata-dz\ Medium\ 9
    elseif has("gui_win32")
        set guifont=Inconsolata-dz:h9
    endif
endif
