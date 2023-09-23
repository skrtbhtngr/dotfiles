"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

filetype plugin on          "Filetype-specific auto-indenting

syntax on                   "Syntax highlighting

colorscheme onedark         "Enable onedark theme

let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'active': {
	\	'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'absolutepath', 'modified']],
    \   'right': [['lineinfo'], ['filetype']]
	\ },
	\ 'component': {
	\	'gitbranch': '(%{FugitiveHead()})'
	\ },
    \ }

let g:coc_disable_startup_warning = 1

set t_Co=256                "Display 256 colors (usually the default setting)
set wildmenu                "Better command-line completion
set autoindent              "Keep the same indent as the line you're currently on
set guicursor=              "Prevent block cursor from turning into i-beam in insert mode
set ruler                   "Display the cursor position on the last line of the screen or in the status line of a window
set cursorline              "Enable cursor line
set number                  "Display line numbers on the left
set tabstop=4               "Tells how many cols a tab counts for. Affects how the existing text displays.
set softtabstop=4           "Sets how many cols vim uses when you use Tab in insert mode; backspace deletes whole Tab space
set laststatus=2            "Always show the status line
set shiftwidth=4            "Shift 4 places when indenting
set expandtab               "Translate tabs to spaces!!
set backspace=indent,eol,start  "Allow backspacing over autoindent, line breaks and start of insert action
set hlsearch                "Highlight the search term matches, if found
set incsearch               "Start searching as soon as a character is entered, refine search on every change in search string
set autoread                "Re-read the file if changed from another program
set updatetime=100          "Rate at which swap file is updated
set noerrorbells            "Supress annoying noise
set novisualbell

"Use F2 to translate tabs to spaces in current file
nmap <F2> :retab<CR>

"Use F3 to toggle in and out of Paste mode. Useful when pasting indented text.
set pastetoggle=<F3>

"Use F4 to toggle line numbers
nmap <F4> :set invnumber<CR> :GitGutterToggle<CR>

"Set paths to search on for tags file
set tags=./tags,tags;$HOME

"Code folding
nnoremap F zfa}<CR>
set viewoptions=folds,cursor
set sessionoptions=folds

"Save and load folds acroos file open/close
augroup persist_folds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END

let g:AutoPairs = {'(':')', '[':']', '{':'}', '```':'```', '"""':'"""', "'''":"'''"}

"Set nerdtree window size
let g:NERDTreeWinSize = 15

"Automatically close nerdtree on quit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <C-e> :NERDTreeToggle<CR>

if has("cscope")
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.
        let s:dirs = split(getcwd(), "/")
        while s:dirs != []
                let s:path = "/" . join(s:dirs, "/")
                if (filereadable(s:path . "/cscope.out"))
                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                        break
                endif
                let s:dirs = s:dirs[:-2]
        endwhile

        set csto=0	" Use cscope first, then ctags
        set cst		" Only search cscope
        set csverb	" Make cs verbose

        " s: Find this C symbol
        nmap <C-f>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        " g: Find this definition
        nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
        " c: Find functions calling this function
        nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
        " t: Find this text string
        nmap <C-f>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        " e: Find this egrep pattern
        nmap <C-f>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        " f: Find this file
        nmap <C-f>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        " i: Find files #including this file
        nmap <C-f>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        " d: Find functions called by this function
        nmap <C-f>d :cs find d <C-R>=expand("<cword>")<CR><CR>

        nmap <C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

        " Open a quickfix window for the following queries.
        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

nnoremap <F5> :cprev<CR>
nnoremap <F6> :cnext<CR>

nnoremap <F9> :call QuickfixToggle()<CR>

"https://learnvimscriptthehardway.stevelosh.com/chapters/38.html
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

set clipboard=unnamedplus

set exrc
set secure

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

