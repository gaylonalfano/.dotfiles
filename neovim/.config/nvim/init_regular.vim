" Regular Vim minimal config. I have two separate inits: init_vscode.vim and
" init_regular.vim
" ============================================================================ "
" ===                           GENERAL OPTIONS                            === "
" ============================================================================ "
syntax on

" set guicursor=
set nohlsearch
set noerrorbells

" Set line number
set nu
set nowrap

" Perform case insensive search unless I use CAPS
set smartcase
set noswapfile

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" === Search === "
" Incremental search i.e. while I search I get results
set incsearch
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Line numbers
set relativenumber
"set nonumber
"set number

" Don't show last command
"set noshowcmd
set noshowmatch
set noshowmode

" Yank and paste with the system clipboard
set clipboard+=unnamed

" Hides buffers instead of closing them
set hidden

" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set tabstop=2 softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
set nowrap

" === Indentation === "
" Attempt smart indentation
set smartindent
set autoindent
" Backspace through anything in insert mode
set backspace=indent,eol,start

" Don't highlight current cursor line
"set nocursorline
set cursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
"set noruler

" Always show N lines above/below cursor
set scrolloff=8

" Only one line for command line
set cmdheight=1

" Don't give completion messages like 'match 1 of 2'
" or 'The only match' or give |ins-completion-menu| messages
set shortmess+=c

" Autoload file changes. Can always undo with 'u'
set autoread

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Enable true color support
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Editor theme
set background=dark

" === Netrw === "
" https://shapeshed.com/vim-netrw/
" Remove directory banner
let g:netrw_banner = 1

" Default display style (four total options using 'i' to cycle)
let g:netrw_liststyle = 3

" Open files in new window (1-hsplit, 2-vsplit, 3-newtab, 4-prevwin)
let g:netrw_browse_split = 1

" Autoresize explore window
let g:netrw_winsize = 25

" Can set defaults for window splits
"set splitbelow
"set splitright
" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

call plug#begin('~/.config/nvim/plugged')

Plug 'easymotion/vim-easymotion'
" Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-lists'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-unimpaired'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'
" Plug 'altercation/vim-colors-solarized'
"Plug 'wellle/targets.vim'
"Plug 'thaerkh/vim-workspace'
"Plug 'mattn/emmet-vim'
"Plug 'airblade/vim-gitgutter'
"Plug 'jreybert/vimagit'
"Plug 'rhysd/git-messenger.vim'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'sheerun/vim-polyglot'
"Plug 'ryanoasis/nerd-fonts'
"Plug 'ryanoasis/vim-devicons'
"Plug 'kaicataldo/material.vim'
"Plug 'liuchengxu/vim-which-key'
"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

"" === Markdown Composer ===
"function! BuildComposer(info)
"  if a:info.status != 'unchanged' || a:info.force
"    if has('nvim')
"      !cargo build --release --locked
"    else
"      !cargo build --release --locked --no-default-features --features json-rpc
"    endif
"  endif
"endfunction
"

" Initialize plugin system
call plug#end()

" Adding but not sure why lol
scriptencoding utf-8

" Theme UI
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
" colorscheme solarized
" set background=dark

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================

" " === NERDTree === "
" " Show hidden files/directories
" let g:NERDTreeShowHidden = 1

" " Show minimal UI for NERDTree
" let g:NERDTreeMinimalUI = 1

" " Set default window width for NERDTree
" let g:NERDTreeWinSize = 30

" === CoC Plugin === "
" coc-python MS Python Language Server
" set statusline^=%{coc#status()}

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" vim-flake8 plugin (not coc-python flake8) only run when writing .py files
" "autocmd BufWritePost *.py call flake8#Flake8()

" coc-python status line :h coc-status configuration with lightline.
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" Resize status:  https://github.com/itchyny/lightline.vim/issues/402
" Truncate right side %<
" Show mode in inactive window as well using 'inactive'
let g:lightline = {
  \ 'component': {
    \ 'lineinfo': '%3l:%-2v%<',
  \ },
  \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
  \ },
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'inactive': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

" let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#buferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
" Map leader to spacebar
let g:mapleader="\<space>"

" Execute shell command for file in current buffer use full path
" Permissions issue then need chmod +x ./file.type. Adding 'python' for now.
" nnoremap <leader>rp :! python %:p<Enter>
" autocmd FileType python nnoremap <buffer> <leader>rp :! python %:p<Enter>:botright split | term python %
"to open terminal buffer below.

"" Use `u` to undo, use `U` to redo, mind = blown
"nnoremap U <C-r>

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

" provide hjkl movements in Insert mode via the <Alt> modifier key (or M for
" meta) -- Could never get to work.
" inoremap <A-h> <C-o>h
" inoremap <A-j> <C-o>j
" inoremap <A-l> <C-o>l
" inoremap <A-k> <C-o>k

" Quickly open vim init
nnoremap <Leader><CR> :vsp ~/.config/nvim/init_regular.vim<CR>

" Quicksearch help docs - Use FZF :Helptags! instead (see below)
" nnoremap <leader>h :h <C-R>=expand("<cword>")<CR><CR>

" Replace all instances of current word under cursor. -c flag for confirm
nnoremap <Leader>r yiw:%s/\<<C-r><C-w>\>//g<left><left>
" nnoremap <Leader>r yiw:%s/\<<C-r><C-w>\>//gc<left><left><left>

" Move visual selected lines up or down with shift j/k and reformats
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
        \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" Close terminal buffer by just pressing Enter
" https://vi.stackexchange.com/questions/15535/neovim-how-to-close-the-terminal-buffer-by-just-pressing-enter
" map <Leader>p :w<CR>:split \| terminal python %<CR>:startinsert<CR>

" Exit Terminal Mode with <Esc> key
tnoremap <Esc> <C-\><C-n>

" Exit Terminal Mode with <Esc> key and close buffer
" tnoremap <Esc> <C-\><C-n>:q!<CR>

" ==== COC Plugin ============================================================ "
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
" https://github.com/neoclide/coc.nvim#example-vim-configuration
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Disable parsing from buffers with a lot of data for typescript
" https://github.com/neoclide/coc.nvim/pull/1729
autocmd FileType typescript :let b:coc_enabled = 0

" Resolve workspace folder to fix unresolved-import error: https://vi.stackexchange.com/questions/25076/coc-python-reports-unresolved-import-in-git-subfolder
" Add '.env' or '.venv' or '.pyenv_version' etc.
autocmd FileType python :let b:coc_root_patterns = ['.git', '.env', '.python-version']

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" " Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>

nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)


" ==== vim-easy-align ========================================== "
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" ==== Easymotion Plugin ======================================= "
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Change default prefix <Leader><Leader> to <Leader>
map <Leader> <Plug>(easymotion-prefix)

" Overwin Motions
" Avoid repetive use of h, j, k, l keys. l,h not needed with s,f motions!
" map <Leader>l <Plug>(easymotion-lineforward)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)

" <Leader>f{char} to move to {char} - Use 's' instead. Frees up for FZF
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Move to line - Not needed if using JKsf motions!
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word - Not needed if using JKsf motions!
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" ==== FZF ===================================================== "
" Inspiration - https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
" Make it easy to switch between buffers
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
" Tag finder - T is good with gutentags
nmap <Leader>t :Btags<CR>
nmap <Leader>T :Tags<CR>
" Line Finder
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
" Project Finder
nmap <Leader>/ :Rg<Space>
" Help Finder
nmap <Leader>H :Helptags!<CR>
" Key Mappings Finder
nmap <Leader>M :Maps<CR>

" ==== gutentags =============================================== "
" Was getting a weird bug: https://github.com/ludovicchabant/vim-gutentags/issues/178
" let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']

" " ==== NERDTree Plugin ========================================= "
" " Using nn and nf to avoid conflicts with Easymotion
" nmap <Leader>nn :NERDTreeToggle<CR>
" nmap <Leader>nf :NERDTreeFind<CR>

" ==== UndoTree ================================================ "
nnoremap <Leader>u :UndotreeShow<CR>


" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Use ripgrep as grepprg
if executable('rg')
  set grepprg=rg\ --vimgrep\ --hidden\ --no-ignore-vcs
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Speed up gitgutter
" set updatetime=100

" Permanantly expand gitgutter signcolumn
set signcolumn=yes

" coc-python status line :h coc-status Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" " Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " NERDTree BufError when restoring session (:h sessionoptions)
" set sessionoptions-=blank

" Set python_host_prog for python interpreter: https://neovim.io/doc/user/provider.html
let g:python3_host_prog = '/Users/gaylonalfano/.pyenv/versions/fastapi-full-stack/bin/python'
