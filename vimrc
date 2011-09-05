" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.

filetype plugin on
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.
set nowrap
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set path=/home/jonathan/MonsterPortalFB/**
" UNCOMMENT TO USE
"set tabstop=2                    " Global tab width.
"set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
colorscheme topfunky-light

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
set runtimepath+=/home/jonathan/.vim/vim-addons/vim-addon-manager
autocmd BufNewFile,BufRead *.hx set filetype=haxe
autocmd BufNewFile,BufRead *.as set filetype=haxe
" autocmd BufNewFile,BufRead *.hx source ~/haxe.vim

" autocmd FileType haxe set omnifunc=haxecomplete#Complete

fun SetupVAM()
	let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
	exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'
	if !isdirectory(vam_install_path.'/vim-addon-manager') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
		exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
	endif
	call vam#ActivateAddons([], {'auto_install' : 0})
endfun

call SetupVAM()
call vam#ActivateAddons(["vim-haxe"])
imap <F4> <esc>:w<CR>\|:! ant compileSWF; ant build-ui-norules;<CR>
imap <F5> <esc>:w<CR>\|:! ant;<CR>

map <F4> :w<CR>\|:! ant compileSWF; ant build-ui-norules;<CR>
map <F5> :w<CR>\|:! ant;<CR>

map <F2> :vsplit+:find**/<C-R>=expand('<cword>').'.hx'<CR>
imap <F2> <esc>:vsplit+:find**/<C-R>=expand('<cword>').'.hx'<CR>

"map <F3> :vimgrep /public [function|var|override]/ **/<C-R>=expand('<cword>').'.hx'<CR>:copen<CR>
map <F3> :execute 'vimgrep /public [function\|var\|override\|static\|inline]/ **/'.expand('<cword>').'.hx'<CR>:bp<CR>:copen<CR>

"imap <C-i> :execute 'vimgrep /import.*'.expand('<cword>').'/ ~/MonsterPortalFB/haxe/game/src/monster/**/*.hx' | yy | :bd<CR>
"imap <C-c> <esc>:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

"com! Snippets call Snipple()
"function! Snipple()
"	  for myfiletype in split(&ft, "\\.")
"		      exec "split ~/.vim/snippets/" .myfiletype. ".snippets"
"		        endfor
"		endfunc
"	  endfor
"endfunction
