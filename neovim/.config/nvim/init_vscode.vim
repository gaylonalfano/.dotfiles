" PURE VIM FOR VSCODE CONFIG - 20200409
" ============================================================================ "
" ===                               PLUGINS                                === "

" === VS Code ===
" Need to wrap the entire config in this to prevent conflicts.
" Don't need all the Vim plugins for VSCode
if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif


" === vim-plug ===
call plug#begin('~/.config/nvim/plugged')

" Plug 'easymotion/vim-easymotion'
Plug 'asvetliakov/vim-easymotion'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-lists'
" Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wellle/targets.vim'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-unimpaired'


" Initialize plugin system
call plug#end()

" Adding but not sure why lol
scriptencoding utf-8


" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" Map leader to spacebar
let g:mapleader="\<space>"

" Yank and paste with the system clipboard
set clipboard+=unnamed

"" Use `u` to undo, use `U` to redo, mind = blown
"nnoremap U <C-r>

" Probably will map CAPS to ESC and CTRL (when pressed)

" VSCode Commentary (basically built-in vim-commentary)
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Read :help terminal-input -- To use ALT+{h,j,k,l} to navigate windows from any mode:
"      :tnoremap <A-h> <C-\><C-N><C-w>h
"      :tnoremap <A-j> <C-\><C-N><C-w>j
"      :tnoremap <A-k> <C-\><C-N><C-w>k
"      :tnoremap <A-l> <C-\><C-N><C-w>l
"      :inoremap <A-h> <C-\><C-N><C-w>h
"      :inoremap <A-j> <C-\><C-N><C-w>j
"      :inoremap <A-k> <C-\><C-N><C-w>k
"      :inoremap <A-l> <C-\><C-N><C-w>l
"      :nnoremap <A-h> <C-w>h
"      :nnoremap <A-j> <C-w>j
"      :nnoremap <A-k> <C-w>k
"      :nnoremap <A-l> <C-w>l

" Quick window switching from normal mode
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Exit Terminal Mode with <Esc> key
tnoremap <Esc> <C-\><C-n>

" Exit Terminal Mode with <Esc> key and close buffer
" tnoremap <Esc> <C-\><C-n>:q!<CR>

" Move visual selected lines up or down with shift j/k and reformats
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ==== vim-easy-align =============================================================== "
" nmap ga <Plug>(EasyAlign)
" xmap ga <Plug>(EasyAlign)

" ==== Easymotion Plugin ============================================================ "

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Change default prefix <Leader><Leader> to <Leader>
map <Leader> <Plug>(easymotion-prefix)

" Overwin Motions -- THESE MAY NOT WORK WITH CUSTOM easymotion plugin!
" https://github.com/asvetliakov/vim-easymotion
" Avoid repetive use of h, j, k, l keys
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-f)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
nmap t <Plug>(easymotion-bd-t)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Use ripgrep as grepprg
if executable('rg')
  set grepprg=rg\ --vimgrep\ --hidden\ --no-ignore-vcs
  set grepformat=%f:%l:%c:%m,%f:%l:%m

endif

set cursorline

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" VS Code run Find in files for word under cursor. 
" I want to be able to replicate stock Vim /* operation to find occurrences of
" current word under cursor. Not sure if this is it...NOPE! Not what I want!
" See below for *:%s//foo/g
" nnoremap <silent> ? :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

" Replace all occurrences of word under cursor with new string using
" ERROR: Can't get VS Code to perform the cursor move <left>...
" <leader>rNewString<CR>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g<left><left>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g<C-b><C-b>
"nnoremap <leader>r *:%s///g<C-b><C-b>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g|<C-u>call VSCodeNotify('cursorMove', { 'to': 'left', 'by': 'character', 'value': 2 })<CR>
" The wildmenu has a builtin 1.5 second timeout delay. 
" Vim has built-in sleep: nnoremap <Leader>ss :set columns=95<CR>:sleep 5m<CR><C-l>
" nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g|:sleep 1600m<CR><left><left>  " Doesn't move
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g|:sleep 2000m<C-b><C-b>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g|:sleep 4<C-b><C-b>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g|:sleep 2000m<CR><C-u>call VSCodeNotify('cursorMove', { 'to': 'left', 'by': 'character', 'value': 2 })<CR>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g|:sleep 2000m|<C-u>call VSCodeNotify('cursorMove', { 'to': 'left', 'by': 'character', 'value': 2 })<CR>
"nnoremap <leader>r *:|:sleep 2000m|%s///g<left><left>
"nnoremap <leader>r *::sleep 2000m|%s///g<left><left>
"nnoremap <leader>r yiw:%s///g|:sleep 4<CR><left><left>
"nnoremap <leader>r yiw:%s///g|:sleep 4<CR><C-b><C-b>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//<left>
"nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>/|:sleep 2<ctrl-b><ctrl-b>
nnoremap <leader>r yiw:%s/\<<C-r><C-w>\>//g<left><left>


" Automatically re-read file if a change was detected outside of vim
set autoread

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile
