set number
set cursorline
set termguicolors
set clipboard+=unnamedplus
colorscheme desert

let mapleader = ","

nmap <C-F12> :e $MYVIMRC<cr>
" Same as C-F12. Need to fix Neovim bug:
" Ctrl/Shift + function keys mappings do not work #7384
" https://github.com/neovim/neovim/issues/7384
nmap <F36> :e $MYVIMRC<cr>
nmap <C-F11> :source $MYVIMRC<cr>
" Same as C-F11
nmap <F35> :source $MYVIMRC<cr>

" Remove tailing space on save any file
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

au FocusGained, BufEnter * :silent! !
au FocusLost, WinLeave * :silent! w
