let g:python3_host_prog="/usr/bin/python"

set et sts=4 sw=4 ts=4
set number
set relativenumber
set hidden

inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

" NERDTree

" Open NERDTree automatically, if a file is specified, put cursor in file.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Keymaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>f :FZF<CR>

" Show hidden files
let g:NERDTreeShowHidden = 1

" Airline
let g:airline#extensions#tabline#enabled = 1

" Switch between buffers
function SwitchFunc(bnum)
	execute "bfirst"
	if a:bnum > 1 | execute (a:bnum - 1) . "bn" | endif
endfunction

for i in range(1, 9)
    execute 'nnoremap <Leader>'.i.' :call SwitchFunc('.i.')<CR>'
endfor

nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>d :b#<CR>:bw#<CR>

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/coc.vim
