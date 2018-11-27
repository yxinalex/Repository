""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 							Alex - NeoVim for Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 							Vim Install & Pre-Install
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTES_01:
" $sudo apt install vim
" $sudo apt install ctags
" $sudo apt-get install silversearcher-ag
" $vim --version | grep "clipboard"     "Check if vim support system clipboard
" $sudo apt-get install vim-gnome       "Install this GUI vim to support system clipboard
" $git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
" Copy Vim Config to ~/.vimrc
" $vim +PluginInstall +qall, or :PluginInstall

" Use Vim settings, rather then Vi settings. This setting must be as early as 
" possible, as it has side effects. 
" set nocompatible        "Be Improved
" filetype off            "Required 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PlugList                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: 'C:\Neovim\share\nvim\plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('C:\Neovim\share\nvim\plugged')
" Make sure you use single quotes

" Multiple Plug commands can be written in a single line using | separators, such as below
" Plug 'tomasr/molokai' | Plug 'altercation/solarized'

Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'tomasr/molokai' | Plug 'altercation/solarized' | Plug 'fcevado/molokai_dark'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

" Plug 'Xuyuanp/nerdtree-git-plugin'  
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'majutsushi/tagbar'
" Plug 'rking/ag.vim'
" Plug 'Yggdroot/LeaderF'


call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Plugin Manager Command                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle Command
" $vim +PluginInstall +qall
" :PluginList
" :PluginInstall
" :PluginSearch
" :PluginClean
" :BundleList
" :BundleInstall
" :BundleInstall!
" :BundleSearch
" :BundleSearch!
" :BundleClean
" :BundleClean!
" :h vundle Get more details and wiki and FAQ




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Initialize plugin system
filetype plugin indent on

let g:python3_host_prog='C:\Python36\python.exe'
let g:python_host_prog='C:\Python36\python.exe'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 								NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let NERDTreeDirArrows=1
" let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1		" Don't show help menu
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=0
let NERDTreeWinSize=30
let NERDTreeIgnore=
    \[
    \'\.doc', '\.docx', '\.xls', '\.xlsx', '\.pdf',
    \'\.vsd', '\.uml', '\.graphml',
    \'\.zip', '\.rar',
    \'\.jpg','\.bmp','\.png'
    \]


" vim doesn't special file, auto open nerdtree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim opens one dir, auto open nerdtree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" vim doesn't have any file opened wiht only nerdtree opened, auto quit vim
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
"
" ##################################################################################
" 				NERDCommenter
" ##################################################################################
let g:NERDSpaceDelims = 1           " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1       " Use compact syntax for prettified multi-line comments
" let g:NERDDefaultAlign = 'left'     " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1        " Set a language to use its alternate delimiters by default
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1     " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting

" <leader>cc |NERDComComment|               " Comment out the current line or text selected in visual mode
" <leader>cn |NERDComNestedComment|         " Same as cc but forces nesting
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa
" <leader>c<space> |NERDComToggleComment|   
" <leader>cm |NERDComMinimalComment|        " Comments the given lines using only one set of multipart delimiters
" <leader>ci |NERDComInvertComment|         " Toggles the comment state of the selected line(s) individually
" <leader>cs |NERDComSexyComment|           " Comments out the selected lines with a pretty block formatted layouot
" <leader>cy |NERDComYankComment|           " Same as cc except that the commented line(s) are yanked first
" <leader>c$ |NERDComEOLComment|            " Comments the current line from the cursor to the end of line
" <leader>cA |NERDComAppendComment|         " Adds comment delimiters to the end of line and goes into insert mode between them
" |NERDComInsertComment|                    " Adds comment delimiters at the current cursor position and inserts between. Disabled by default
" <leader>ca |NERDComAltDelim|              " Switches to the alternative set of delimiters
" Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb)
" <leader>cl, <leader>cb, |NERDComAlignedComment|        
" <leader>cu |NERDComUncommentLine|         " Uncomments the selected line(s)



" ##################################################################################
" 				vim-nerdtree-tabs
" ##################################################################################
" let g:nerdtree_tabs_open_on_console_startup=1

" ##################################################################################
" 				nerdtree-git-plugin
" ##################################################################################
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ "Unknown"   : "?"
"     \ }


" ##################################################################################
" 				vim-airline
" ##################################################################################
" :help airline
set laststatus=2

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
" let g:airline_detect_modified=1
" let g:airline_detect_paste=1
" let g:airline_detect_crypt=1
" let g:airline_detect_spell=1
" let g:airline_detect_spelllang=1


" *airline-tabline*
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"
" *airline-nerdtree*
"
" *airline-tagbar*
" let g:airline#extensions#tagbar#enabled = 1
" let g:airline#extensions#tagbar#flags = ''
" let g:airline#extensions#tagbar#flags = 'f'
" let g:airline#extensions#tagbar#flags = 's'
" let g:airline#extensions#tagbar#flags = 'p'
"

" ##################################################################################
" 				vim-airline-themes
" ##################################################################################
" NOTES_02:
" Put the self-customized-airline-theme into below path
" "/.vim/bundle/vim-airline-themes/autoload/airline/themes/"
"
" :help airline-themes.txt
" :AirlineTheme <theme>
" let g:airline_theme='alexdark'
" let g:airline_theme='alexdarkfull'
" let g:airline_theme='dark' 
" let g:airline_theme='badwolf'
" let g:airline_theme='powerlineish' 
" let g:airline_theme='hybridline' 
" let g:airline_theme='tomorrow' 
" let g:airline_theme='kalisi' 
" let g:airline_theme='simple'
" 
" let g:airline_theme='murmur' 
" let g:airline_theme='serene' 
" let g:airline_theme='zenburn' 
" let g:airline_theme='violet' 
"
" let g:airline_theme='cool' 
" let g:airline_theme='papercolor' 
" let g:airline_theme='soda' 
" let g:airline_theme='understated' 


" ##################################################################################
" 				tagbar
" ##################################################################################
" NOTES_03:
" let g:tagbar_ctags_bin='C:\ctags\'  
" let g:tagbar_width=30  
" let g:tagbar_right=0

" Enabled this feature, it will impact vimdiff feature because tagbar is also buffer, the tagbar will be joined the compare 
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() 


" ##################################################################################
" 			silversearcher - Ag
" ##################################################################################
" Speed Compare: ag>ack>grep
"
" :vimgrep /{pattern}/ /yourpath
" :cprev[ious]
" :cnext 
" :cfirst
" :clast 
"
" :set grepprg=ag

" :h Ag
" :!man ag
" :AgHelp --c
" :AgBuffer[!] [options] {pattern}
" :AgAdd [options] {pattern} [{directory}] 
" :AgFromSearch [{directory}] 
" :LAg [options] {pattern} [{directory}] 
" :LAgBuffer [options] {pattern} 
" :LAgAdd [options] {pattern} [{directory}] 
" :AgFile [options] {pattern} [{directory}]

" Ag --list-file-types              " List Ag support file types
" --asm                             " .asm, .s 
" --hh                              " .h
" --cc                              " .c, .h, .xs
" --cpp                             " .cpp, .cc, .C, .cxx, .m, .hpp, .hh, .h, .H, .hxx
" --csharp                          " .cs
" --java                            " .java, .properties
" --js                              " .js, .jsx
" --json                            " .json
" --make                            " .Makefiles, .mk, .mak
" --batch                           " .bat, .cmd
" --markdown                        " .markdown, .mdown, .mdwn, .mkdn, mkd, .md
" --python                          " .py
" Ag --asm --cc --cpp -sw {Symbol}
"
" Ag --cc -sw {pattern}             " --cc means .c, .h, .xs
" Ag -asw {pattern}                 " -a means all files, -s means Match case-sensitively, -w means match whole words
" Ag --cc -iw {pattern}             
" Ag -aiw {pattern}                 " -a means all files, -i means ignore-case Match ase-insensitively, -w means match whole words
" Ag --cc --count -sw {pattern}     " Only print the number of matches in each file
"
" Ag --asm --cc --cpp -sw {pattern} ./home/alex/project/path/   " Search in specific folder path

" e    to open file and close the quickfix window
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ag.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window
"
" let g:ag_prg="<custom-ag-path-goes-here> --vimgrep" 	"  specify a custom ag name and path
" let g:ag_working_path_mode='r'		" configure ag.vim to always start searching from your project root instead of the cwd


" ##################################################################################
" 				taglist
" ##################################################################################
" let Tlist_File_Fold_Auto_Close=1
" let Tlist_WinHeight=30
" let Tlist_WinWidth=30
" let Tlist_Use_Horiz_Window=1
" let Tlist_Sort_Type=name

" let Tlist_Show_One_File=1
" let Tlist_WinWidth=30
" let Tlist_Exit_OnlyWindow=1
" let Tlist_Use_Right_Window=1
" let Tlist_Use_SingleClick=1
" let Tlist_Auto_Open=1

" <CR>        jump tag's definition 
" o           open tag in new window
" <Space>     show tag prototype
" u           Update taglist 
" s	      change sort between time and name
" x           increase or decease taglist the window size
" +           open zedie, ==zo
" -           close zedie, ==zc
" *           open all zedie, ==zR
" =           close all zedie, ==zM
" [[          jump the previous file
" ]]          jump the next file
" :TlistOpen
" :Tlist
" :TlistClose
" :TlistToggle


" ##################################################################################
" 				LeaderF
" ##################################################################################
" NOTES_04:
" vim7.3 or higher. Only support vim7.4.330 or higher after v1.01. 
" :LeaderfFile or :LeaderfFile [directory] or ,f	" Launch LeaderF to search files.
" :LeaderfBuffer or ,b					" Launch LeaderF to search buffers.
" :LeaderfBufferAll
" :LeaderfMru						" Launch LeaderF to search Mru.
" :LeaderfMruCwd					" Launch LeaderF to search Mru in current working directory.
" :LeaderfLine
" :LeaderfLineAll
" :LeaderfTag						" Launch LeaderF to navigate tags.
" :LeaderfBufTag					" Launch LeaderF to navigate tags in current buffer.
" :LeaderfBufTagAll					" Launch LeaderF to navigate tags in all opening buffers.
" :LeaderfHelp
" :LeaderfColorscheme  

" NOTES_05:
" let g:Lf_Ctags = "C:\ctags\"

" Once LeaderF is launched:
" <C-C>, <ESC> : quit from LeaderF.
" <C-R> : switch between fuzzy search mode and regex mode.
" <C-F> : switch between full path search mode and name only search mode.
" <Tab> : switch to normal mode.
" <C-V>, <S-Insert> : paste from clipboard.
" <C-U> : clear the prompt.
" <C-J>, <Down>, <C-K>, <Up> : navigate the result list.
" <2-LeftMouse> or <CR> : open the file under cursor or selected(when multiple files are selected).
"
" <C-X> : open in horizontal split window.
" <C-]> : open in vertical split window.
" <C-T> : open in new tabpage.
" <F5> : refresh the cache.
" <C-LeftMouse> or <C-S> : select multiple files.
" <S-LeftMouse> : select consecutive multiple files.
" <C-A> : select all files.
" <C-L> : clear all selections.
" <BS> : delete the preceding character in the prompt.
" <Del> : delete the current character in the prompt.
" <Home>: move the cursor to the begin of the prompt.
" <End> : move the cursor to the end of the prompt.
" <Left>: move the cursor one character to the left.
" <Right> : move the cursor one character to the right. 
" <C-P> : preview the result.





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               common setting                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ##########################################################################################
"                                 	 Vim KeyMap - Plugin Key
" ##########################################################################################
" commend   normal   Visual   OperatorPending     InsertOnly  CommandLine
" :map      y        y        y
" :nmap     y
" :vmap              y
" :omap                       y  
" :map!                                           y           y
" :imap                                           y
" :cmap                                                       y
" 
" :h key-notation	" Meaning in Keyboard 

" nore: no recursion
" n:    in normal mode
" v:    in visual mode
" i:    in insert mode
" c:    in command line
" un:   <ctrl> combined key following 'u', it means to delete this key map
" clear:it means that to clear all of key map in special mode
" For example: map, nmap, imap, vmap, vnoremap, nunmap, nmapclear

" For Example: 
" <C-Esc>=Ctrl+Esc, <S-F1>=Shift+F1, <A-S>=Alt+S, <CR>=Enter, <Leader>=\, <BS>=BackSpace
" Bash: <C-s>=LockVim, <C-q>=QuitLockVim 	" !stty -ixon	" Disable Bash: <C-s>, <C-q>

let mapleader = '\'


"""""""""""""""""""""""""""""""""""""""
"	 NERDTree Key Map
"""""""""""""""""""""""""""""""""""""""
nmap <F2> :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""
"	 NERDCommenter Key Map
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"	 tagbar Key Map
"""""""""""""""""""""""""""""""""""""""
nmap <F3> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""
"	 ctags Key Map
"""""""""""""""""""""""""""""""""""""""
" NOTES_07:
" nmap <F5> :!ctags -R --fields=+iaS --extra=+q *<CR>
nmap <silent><F10> :!ctags -R<CR><CR>
" nmap <Leader>d <C-]> 
nmap <C-k> <C-]>
nmap <C-j> <C-t>

"""""""""""""""""""""""""""""""""""""""
"	 taglist Key Map
"""""""""""""""""""""""""""""""""""""""
" nmap <F11> :TlistToggle<cr>

"""""""""""""""""""""""""""""""""""""""
"	 silversearcher - Ag
"""""""""""""""""""""""""""""""""""""""
nmap <Leader>g :Ag --asm --cc --cpp -sw 

"""""""""""""""""""""""""""""""""""""""
"	 LeaderF Key Map
"""""""""""""""""""""""""""""""""""""""
nmap <Leader>fh  :LeaderfHelp<cr>
nmap <Leader>ff  :LeaderfFile<cr>
" nmap <Leader>fb :LeaderfBuffer<cr>
nmap <Leader>fb  :LeaderfBufferAll<cr>
nmap <Leader>fr  :LeaderfMruCwd<cr>
nmap <Leader>far :LeaderfMru<cr>
nmap <Leader>fl  :LeaderfLine<cr>
nmap <Leader>fal :LeaderfLineAll<cr>
nmap <Leader>ft  :LeaderfBufTag<cr>
nmap <Leader>fbt :LeaderfBufTagAll<cr>
nmap <Leader>fat :LeaderfTag<cr>


"""""""""""""""""""""""""""""""""""""""
"	 NeoComplete Key Map
"""""""""""""""""""""""""""""""""""""""
" Vim default Auto Complete Key:
" <c-n>-	Normal Key
" <c-x><c-n>-	Current Buffer
" <c-x><c-i>-	Include File Key
" <c-x><c-]>-	Tag File Key
" <c-x><c-k>-	Dictory Search
" <c-x><c-l>-	Complete the whole line
" <c-x><c-f>-	File name complete
" <c-x><c-o>-	Full Function complete
" <c-n>- Next
" <c-p>- Previous
" <c-y>- Enter
" <c-e>- Exit Complete List

" Plugin key-mappings
" <Tab> neocomplete#start_manual_complete()
" <C-y> neocomplete#close_popup()
" <C-e> neocomplete#cancel_popup()
" <C-h>, <BS> neocomplete#smart_close_popup()
" <C-g> neocomplete#undo_completion()
" <C-l> neocomplete#complete_common_string()
" <Tab>, <C-n> neocomplete#complete_common_string() 

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " For inserting <CR> key.
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 	 Vim KeyMap - Basic Key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <S-h> <C-w>h
" nmap <S-j> <C-w>j
" nmap <S-k> <C-w>k
" nmap <S-l> <C-w>l

nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
nmap gw <C-w>w

nmap <S-j> 5<C-e>
nmap <S-k> 5<C-y>

nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
" nmap <C-Tab> :bp<CR>          " It always isn't effect.

nmap <S-Up> :buffers<CR>
nmap <S-Down> :bdelete<CR>
nmap <S-Right> :bn<CR>
nmap <S-Left> :bp<CR>
nmap <S-Home> :bf<CR>
nmap <S-End> :bl<CR>
nmap <S-Pageup> :bp<CR>
nmap <S-Pagedown> :bn<CR>

nmap <C-Up> :tabnew<CR>
nmap <C-Down> :tabc<CR>
nmap <C-Home> :tabfirst<CR>
nmap <C-Right> :tabn<CR>
nmap <C-Left> :tabp<CR>
nmap <C-End> :tablast<CR>
nmap <C-Pageup> :tabn<CR>
nmap <C-Pagedown> :tabp<CR>

nmap <C-z> u
nmap <silent><Leader>ss :w!<CR>
nmap <silent><Leader>sa :wa!<CR>

nmap <silent><Leader>ps :wa!<CR> :NERDTreeClose<CR> :TagbarClose<CR> :mksession! proj.vim<CR> :wviminfo proj.viminfo<CR>
nmap <silent><Leader>po :source ./proj.vim<CR> :rviminfo ./proj.viminfo<CR>


" nmap <C-x> dd 		
" nmap <C-c> yy 		
" nmap <C-v> p 		
" nmap <C-a> ggvG
"
" vmap <C-x> d
" vmap <C-c> y
" vmap <C-v> p
" vmap <C-a> <Esc>ggvG
"
" imap <C-x> d
" imap <C-c> y
" imap <C-v> p
" imap <C-a> <Esc>ggvG

" Required vim system clipboard support below
nmap <Leader>v "+p
nmap <Leader>w "+yiw
nmap <Leader>x "+diw
" nmap <C-x> "+dd 		
" nmap <C-c> "+yy 		
" nmap <C-v> "+p 		
nmap <C-a> ggvG

vmap <C-v> "+p
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-z> <Esc>uv
vmap <C-a> <Esc>ggvG

imap <C-v> <Esc>"+pi
imap <C-c> "+y
imap <C-x> "+d
imap <C-z> <Esc>ui
imap <C-a> <Esc>ggvG

vmap <silent><Leader>ss <Esc>:w!<CR>v
imap <silent><Leader>ss <Esc>:w!<CR>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 	 Vim KeyPad
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" i, I, a, A, o, O, c, C, x, X, r, R, s, S, v, V, <C-v>
" dd, D, yy, Y, cc, C
" 3dd, 3yy, 3cc
" p, P
"
" vf(char)y         " Select from the current curson to (char), copy it
" vf(char)d         " Select from the current curson to (char), delete it
" vf(char)"+y       " Select from the current curson to (char), copy it to system clipboard
" vf(char)"+d       " Select from the current curson to (char), delete it to system clipboard
"
" "0p, "ap, "Ap, "*p, "+p
" "0dd, "add, "Add, "*dd, "+dd
" "0yy, "ayy, "Ayy, "*yy, "+yy
" "0cc, "acc, "Acc, "*cc, "+cc
" 
" "+p           " Paste from the global system clipboard
" "+y           " Copy it while place it into the global system clipboard
" "+d           " Delete it while place it into the global system clipboard
"
" diw, di{, di}, di(, di), di<, di>, di', di
" daw, da{, da}, da(, da), da<, da>, da', da
" d3w, d3e, d3b, dh, dj, dk, dl, da, ds, dp, d$, d^, d0, dgg, dG, df'*'
"
" yiw, yi{, di}, yi(, yi), yi<, yi>, yi', yi
" yaw, ya{, da}, ya(, ya), ya<, ya>, ya', ya
" y3w, y3e, y3b, yh, yj, yk, yl, ya, ys, yp, y$, y^, y0, ygg, yG, yf'*'
"
" ciw, ci{, ci}, ci(, ci), ci<, ci>, ci', ci
" caw, ca{, ca}, ca(, ca), ca<, ca>, ca', ca
" c3w, c3e, c3b, ch, cj, ck, cl, ca, cs, cp, c$, c^, c0, cgg, cG, cf'*'
"
" viw, vi{, vi}, vi(, vi), vi<, vi>, vi', vi
" vaw, va{, va}, va(, va), va<, va>, va', va
" v3w, v3e, v3b, vh, vj, vk, vl, va, vs, vp, v$, v^, v0, vgg, vG, vf'*'
"
"
"--------------------------------------------------------------------------------------
"  
" <C-w>h, <C-w>j, <C-w>k, <C-w>l, <C-w>w
" <C-e>, <C-d>, <C-f>, <Cy>, <C-u>, <C-b>
" gg, G, (num)G, (num)%, :(num), (num)<Enter>
" 
" h, j, k, l, (num)h, (num)j, (num)k, (num)l, (num)|
" w, e, b, W, E, B 
" H, M, L, zt, zz, zb
" |:  Jump the      beginning of current line
" 0:  Jump the hard-beginning of current line
" ^:  Jump the soft-beginning of current line
" $:  Jump the            end of current line
" %:  Jump between the mached '()', '{}', '<>', '[]', '#if-#else-#endif'.
"
" /, ?
" n, N, *, #
"
" f(x), F(x), t(x), T(x)    " Search char in current line
" ;                         " Repeat forward
" ,                         " Repeat backword
"
" u, U, :earlier 2m     "Undo, Undo the current line, Undo to early 2 minutes
" <C-r>                 "Redo
" .                     "repeat command, '.' means repeat command once
" (num)<command>        "repeat command, '(num)<command>' means repeat command (num) times.
"
"
"
" J                     "Merge Current and Below line into one line
" &                     " Repeat, :s
"
" q(a-z,0-9)            "Start Record command into (a-z)
" q                     "End Record
" @(a-z,0-9)            "Replay the (a-z) Record
" (num)@(a-z,0-9)       "Replay the (a-z) Record (num) timers
" @@                    "Replay the latest Record  Marco
"
"--------------------------------------------------------------------------------------
" 
" <C-i>, <C-o>
" <C-]>, <C-t>, [I, ]I, [i, ]i
"
" gd: Jump the local definition
" gD: Jump the global definition
" g;: Jump the previous Modified place
" g,: Jump The next Modified place
"
" [[: Jump the previous the beginning of function, required the '{' in single line
" ]]: Jump the next     the beginning of function, required the '{' in single line
" []: Jump the previous the       end of function, required the '}' in single line
" ][: Jump the next     the       end of function, required the '}' in single line
" [{: Jump the beginning of current '{}' block
" ]}: Jump the       end of current '{}' block
" [(: Jump the beginning of current '()' block
" ]): Jump the       end of current '()' block
" [/: Jump the beginning of current comments
" ]/: Jump the       end of current comments
"
" {:  Jump the beginning of current pragraph
" }:  Jump the       end of current pragraph 
" (:  Jump the beginning of current sentence
" ):  Jump the beginning of    next sentence
" +:  Jump the beginning of    next line
" -:  Jump the beginning of    prev line
"
" |:  Jump the      beginning of current line
" 0:  Jump the hard-beginning of current line
" ^:  Jump the soft-beginning of current line
" $:  Jump the            end of current line
" %:  Jump between the mached '()', '{}', '#if-#else-#endif'.
"
"
" ~                             //Switch the Lower&Upper case for the selected block
" (SelectedBlock)u, (SelectedBlock)U                          //Switch Lowercase or Uppercase for selected in visual mode
" gUw, gUb, gUe, gU$, gU^       //Switch Uppercase
" guw, gub, gue, gu$, gu^       //Swtich Lowercase

" <<, >>                "left, right indent
" (SelectedBlock)=      "Auto indent for block

"--------------------------------------------------------------------------------------
"
" Auto Complete 
" <c-n>-	Normal Key
" <c-x><c-n>-	Current Buffer
" <c-x><c-i>-	Include File Key
" <c-x><c-]>-	Tag File Key
" <c-x><c-k>-	Dictory Search
" <c-x><c-l>-	Complete the whole line
" <c-x><c-f>-	File name complete
" <c-x><c-o>-	Full Function complete
" <c-n>- Next
" <c-p>- Previous
" <c-y>- Enter
" <c-e>- Exit Complete List


" ##################################################################################
"			Vim Command
" ##################################################################################
set number
" set nu
" set number
" set nonu
" set nonumber
set numberwidth=4
set ruler         " show the cursor position all the time 
" set showcmd       " display incomplete commands 
set laststatus=2  " Always display the status line 
set confirm       " Need confrimation while exit 
set cursorline
" set cursorcolumn
" set autowrite     " Auto Save
" set autowriteall  " Auto Save All
" set completeopt=preview,menu
" set clipboard+=unnamed      " Share clipboard 
" set history=1024 
" set iskeyword+=_,$,@,%,#,-  " don't wrapline if keyword has these char/sign
" set whichwrap=b,s,<,>,[,] 
set hidden

set showmatch
" set matchtime=2

" set foldenable 
" set foldmethod=syntax
" set foldcolumn=0
" setlocal foldlevel=1
" set foldclose=all 

" set filetype=xhtml<CR>
" set filetype=css<CR>
" set filetype=javascript<CR>
" set filetype=php<CR>

" set fileformats=unix,dos,mac
" set fileformat=dos<CR>
" set fileformat=unix<CR>

" q:        " Display the history of command, enter :q to exit the history command
" :shell    " enter shell, exit to shell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Feature
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a 
" set mouse=nv
" n  normal mode
" v  visual mode
" i insert mode  
" c command mode
" h in help fiel for above mode
" a all of mode  
" r skip |lit-enter| prompt
" A auto select  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Softtabs, 4 spaces 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set nowrap
" set wrap 
" set wrapscan          " Search cycle from tail to head in the whole file
" set nowrapscan        " No Search Cycle
" set list
" set nolist


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open & Quit & Save
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $vim -R       "Read-Only
" $vim -b       "Binary
" $vim -M       "Forcefully Read-Only
" $vim -r       "recover *.swp  , ==:recover
"
" :source ~/.vimrc
"
" :w
" :w!
" :q
" :q!
" :e            "reload
" :e!           "drop current changes and reload
" :wq      " ==ZZ,  ==x
" :wq!
" :wa
" :qa
" :wqa!
" :wqall!

" :line_number      "Jump line-number
" :3wfile
" :3,5w file
" :1,.w file
" :.,$w file
" :.,.+5w file
" :1,$w file
"
" :r                :read the current file in this current line
" :r file
" :f(ile) new.c     "Re-name file but not save
" :sav(eas) new.c   "save as
"
"
" :cd               "Change the current working directory of vim
" :lcd              "Change the current window working directory of vim
" :pwd              "Show   the current working directory of vim
" :set autochdir    "Auto set the current editor file directory as the current working directory
" :open /current_working_directory/file  "open file which is in the current working directory or sub working directory
" NOTES: open command can't use Table key to do smart complete, so perfer to use belows
" :badd /path/name_file.txt
" :sp /path/name_file.txt
" :vs /path/name_file.txt
" :vsp /path/name_file.txt
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session & Viminfo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help sessionoptions

" :mksession [session.vim]
" :mksession mysession.vim
" :mks mysession.vim
" :mksession! mysession.vim
" :source mysession.vim
" $vim -S mysession.vim
"
" SessionOptions : blank,buffers,curdir,folds,help,options,tabpages,winsize
set sessionoptions-=word
set sessionoptions-=blank
set sessionoptions+=buffers
set sessionoptions-=curdir
set sessionoptions+=folds
set sessionoptions-=globals
set sessionoptions-=help
set sessionoptions-=localoptions
set sessionoptions-=options
set sessionoptions-=resize
set sessionoptions+=sesdir
set sessionoptions-=slash
set sessionoptions+=tabpages
" set sessionoptions-=unix
set sessionoptions-=winpos
set sessionoptions-=winsize


" :wviminfo [.viminfo]
" :rviminfo [myviminfo.viminfo]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers & Tab & Window
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -u   Out of buffer list
" -%   The current buffer
" -#   Toggle buffer
" -a   Actived buffer, loaded and display
" -h   Hidden buffer, loaded but don't display
" -=   Read-Only buffer
" --   Can't modify buffer, 'modifiable'==0
" -+   Modified Buffer
"
" :ls
" :buffers      "List all of Buffers
" :buffer 4     "Switch to buffer 4
" :b 4          
" :badd new_buffer.txt
" :bdelete 4        "Delete to buffer 4
" :3,5bdelete       "Delete buffer from 3 to 5
" :3, 5 bdelete 
" :3, 5 bd
" :3,5 bd
" :bd 4
" :bnext
" :bn
" :bprevious
" :bp
" :blast
" :bfirst
" <c-6>            "Toggle two buffers next to each other 
"
"
" :tabnew
" :tabc         "Close the current tab
" :tabo         "Close all of tabs except the current tab
" :tabs         "Show all of tabs
" :tabn
" :tabp
"

" :split
" :vsplit
" :sp
" :vs
" :vsp
" :new
" :quite
" :close
" :only
"
" :resize +5
" :vertical resize +5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Register
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTES_08:
" $vim --version | grep "clipboard"     "Check if vim support system clipboard
" $sudo apt-get install vim-gnome       "Install this GUI vim to support system clipboard
"
" :reg
" "*
" "0 - 9    "numbered register
" "a - z    "named register
" "A - Z    "named register
" "-        "small delete register
" ""        "unnamed register
" "*        "system register
" "~        "system register
" "+        "system register
" "
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help mark-motions
" :marks                " List all of marks, [a-z for inside buffers, A-Z for cross buffers, 0-9 for different files]
" `a     "Jump the line column of mark-a
" 'a     "Jump the line head of mark-a
" ''     "Double ' to switch two places between the current and the previous place
"
" :delmarks a
" :delmarks a b c
" :delm a
" :delm a b c
" :delmarks!
" :delm!
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" f, F, t, T
" n, N, *, #
" /, ?              " Search forward, Search backwards
" /^(str)           " Search the str at the head of line
" ?^(str)
" /(str)$           " Search the str at the tail of line
" ?(str)$
" /\<(str)\>        " Search the whole word 
" ?\<(str)\>
"
set incsearch           " do incremental searching 
" set noincsearch       " No incremental searching

set ic                  " set ignorecase
" set noic              " set noignorecase

set hlsearch            " Hightlight search result
" set nohlsearch        " No Hightlight
" :nohl                 " :nohlsearch
"
set wrapscan            " Search cycle (from tail to head, or head to tail) in the whole file
" set nowrapscan        " No Search Cycle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap/Replace - For exmple
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help substitute
" :help Substitute
" 
" :(replace) .... prompt(y/n/a/q/l/^E/^Y)?
"	    'y'	    to substitute this match
"	    'l'	    to substitute this match and then quit ("last")
"	    'n'	    to skip this match
"	    <Esc>   to quit substituting
"	    'a'	    to substitute this and all remaining matches {not in Vi}
"	    'q'	    to quit substituting {not in Vi}
"	    CTRL-E  to scroll the screen up {not in Vi, not available when compiled without the |+insert_expand| feature}
"	    CTRL-Y  to scroll the screen down {not in Vi, not available when compiled without the |+insert_expand| feature}

" :s/str1/str2/        "replace the first str1 in current line, no 'g' means replace only one str1
" :s/str1/str2/g        "fand str1 in current line, use str2 to replace all of str1 in the current line, 'g' means replace all of str1
"
" :%s/str1/str2/g       "find str1 in current file and use str2 to replace all of str1 in the current file
" :%s/str1/str2/gc      "find str1 in current file and use str2 to replace all of str1 in the current file, but need confirm
" :%s/\<str1\>/str2/gc  "find the whole word str1 in current file and use str2 to replace str1 in the current file, but need confirm
" :%s/\<str1\>/str2/gci "find the whole word str1 in current file and use str2 to replace str1 in the current file, insensitive
" 
" :n,m s/str1/str2/g       "from line-n to line-m, find str1 in current file and use str2 to replace all of str1 in the current file
" :1,$ s/str1/str2/g       "from line-1 to line-end, find str1 in current file and use str2 to replace all of str1 in the current file
" :.,$ s/str1/str2/g       "from line-current to line-end, find str1 in current file and use str2 to replace all of str1 in the current file
"
" Special Char - \., \*, \\, \[, \^, \$, \<, \>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete & Copy & Past & Comments
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :n,m co new_line
" :1,$ co $
" :n,m m new_line
"
" :m,n s/^/#/g
" :m,n s/^#//g
"
" :m,n s/^/\/\//g       "Add comments
" :m,n s/^\/\///g       "Remove comments
" :1,$ s/^/\/\//g       "Add comments
" :1,$ s/^\/\///g       "Remove comments
" :%s/^/\/\//g          "Add comments to all of file

" Add comments(V mode, select line, :, normal i//, <CR>)
" Remove comments(<C-v>, select //, delte //)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $vimdiff  FILE_LEFT  FILE_RIGHT
" $vim -d  FILE_LEFT  FILE_RIGHT
" $vimdiff -o main.cpp main2.cpp        " horizontal open
"
" $vim FILE_LEFT
" :vertical diffsplit FILE_RIGHT        " vertical open
"
" :diffsplit file
" :vert diffsplit file
"
" :set noscrollbind
" :set diffopt=context:3
" :set diffopt+=icase
" :set diffopt+=iwhite
" 
" :diffupdate
" :diffget
" :diffput
" :1,100 diffput
" :1,100 diffget
" :1,100 diffget 3  "Specify range line 1~100, buffer ID-3
" 
" :qa
" :wa
" :qa!
" :wqa
"
" zo    "(folding open)
" zc    "(folding close)
" [c    "next change
" ]c    "previous change
" do    "do get
" dp    "do put
" u, <ESC>

set diffopt+=iwhite

set diffexpr=CustomizedDiff()
function CustomizedDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "--ignore-all-space "
   endif
   silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
    \  " > " . v:fname_out
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" class names   
" macro definitions
" enumeration names
" enumerators   
" function definitions
" function prototypes/declarations  
" class, interface, struct, and union data members
" structure names
" typedefs
" union names 
" variables (definitions and external declarations)
"
"
" :set tags=./tags      "Set tags file in current working path
" :!ctags -R
" :!ctags -R *
" :!ctags -R --fields=+iaS --extra=+q *
"   –fields=[+|-]flags      " Specify tags extension fields
"       i: Inheritance information
"       a：Access (or export) of class members
"       S：Signature of routine(e.g. prototype or parameter list
"   –extra=[+|-]flags       " Specify tags extension fields
"       q：Include class member information (e.g. c++,java,Eiffel)
"
" "Jump the System Function Definition
" :!ctags --fields=+iaS --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include
" set tags+=~/.vim/systags

" map <F4> :!ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --languages=c,c++ --links=yes --c-kinds=+c+d+e+f+g+l+m+n+p+s+t+u+v+x --c++-kinds=+c+d+e+f+g+l+m+n+p+s+t+u+v+x --fields=+iaS --extra=+q -R .<CR><CR> :TlistUpdate<CR>
" imap <F4> <ESC>:!ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --languages=c,c++ --links=yes --c-kinds=+c+d+e+f+g+l+m+n+p+s+t+u+v+x --c++-kinds=+c+d+e+f+g+l+m+n+p+s+t+u+v+x --fields=+iaS --extra=+q -R .<CR><CR> :TlistUpdate<CR>
" set tags=tags
" set tags+=./tags
" set tags+=~/.vim/tags/include_tags
" set tags+=~/.vim/tags/local_tags
" set tags+=~/.vim/tags/linux_tags
" set tags+=~/.vim/tags/stl_tags
" set tags+=~/.vim/tags/boost_tags
" set tags+=~/.vim/tags/airnas_tags

" :help tags
" :tags             "List the history of searched/jumped tag
" :tag xyz          "Jump the definition of xyz，or set cursor in xyz to press <C-]>, <C-t>
" :stag xyz         "Use the split window to display xyz, or <C-w>]， <C-w>n], n means that n lines high window
" :ptag xyz         "Open xyz in preview window, or <C-w>}
" :pclose           "Close xyz of preview window, or <C-w>z
" :pedit abc.h      "Edit the abc .h head file in preview window
" :psearch abc      "Search the current .c file and head file to display abc line

" In some case, there are multi-same-match-tag 
" :tselect tagname  "Open selected tag list
" :[n]tnext         "Next[n] match tag
" :[n]tprev         "Prev[n] match tag
" :tfirst           "The First match tag
" :tlast            "The Last match tag

" Tab to auto-complete-tag-name
" :tag xyz<tab>     "Auto-complete-tag-name based on the heading xyz of tag
" :tag /xyz<tab>    "Auto-complete-tag-name based on including xyz of tag

" gd, gD, <C-]>, <C-t>, [I, ]I, [i, ]i, [{, ]}, [(, ])
"

" ##################################################################################
" 					Terminal Font
" ##################################################################################
" NOTES_09:
" Set Terminal Font (Custom Font) = Monospace Regular, 12     " Terminal's Default Font in Ubuntu
" Set Terminal Font (Custom Font) = DejaVu Sans Mono Book, 10 " Vim Terminal's Font in Ubuntu
" Set Terminal Font (Custom Font) = DejaVu Sans Mono, 9       " Sublime's Font in Ubuntu
" Set Terminal Font (Custom Font) = DejaVu Sans Mono Book, 9  " Sublime's Font in Ubuntu
"
" Optiont:
" Set Terminal Font (Custom Font) = consolas, 10
" Set Terminal Font (Custom Font) = Inconsolata, 10
"

" ##################################################################################
" 					Color scheme
" ##################################################################################
" NOTES_10:
" :colorscheme molokai 
set background=dark
set t_Co=256 

syntax enable
syntax on

let g:molokai_original = 1
let g:rehash256 = 1

colorscheme molokai
" colorscheme molokai_dark
" colorscheme solarized


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Customized Color Hightlight Start
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"-------------------------------------------------------
"
"    cterm - sets the style: none, bold, italic, underline
"    ctermfg - set the text color
"    ctermbg - set the highlighting
"    DiffAdd - line was added
"    DiffDelete - line was removed
"    DiffChange - part of the line was changed (highlights the whole line)
"    DiffText - the exact part of the line that changed
"
"-------------------------------------------------------

" molokai.vim default doesn't highlight function
"
"
"-------------------------------------------------------
" Highlight Language
" hilight function name
" autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
" autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"
autocmd BufNewFile,BufRead * :syntax match Alex_CArray       "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s\{0,3\}\["me=e-1
autocmd BufNewFile,BufRead * :syntax match Alex_CFunction    "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s\{0,3\}("me=e-1
autocmd BufNewFile,BufRead * :syntax match Alex_CObeject     "\<[a-zA-Z_][a-zA-Z_0-9]*\>\."me=e-1
autocmd BufNewFile,BufRead * :syntax match Alex_CObejectP    "\<[a-zA-Z_][a-zA-Z_0-9]*\>\->"me=e-2
" Standard Regular expression"\+|-|\*|\/|&|\||~|=|,|\.|\?|<|>|'|%|@|!|#"
" Vim Regular for CLang Syntax"+\{1,2\}[^+]\|-\{1,2\}[^-]\|*\{1,2\}[^*]\|/\{1,2\}[^/]\|%\{1,2\}[^%]\|=\{1,2\}[^=]\|,\{1,2\}[^,]\|:\{1,2\}[^:]\|'\{1,2\}[^']\|?\{1,2\}[^?]\|>\{1,2\}[^>]\|<\{1,2\}[^<]\|&\{1,2\}[^&]\||\{1,2\}[^|]\|\~\{1,2\}[^~]\|!\{1,2\}[^!]"me=e-1
autocmd BufNewFile,BufRead * :syntax match Alex_COperator    "+\{1,2\}[^+]\|-\{1,2\}[^-]\|*\{1,2\}[^*]\|%\{1,2\}[^%]\|=\{1,2\}[^=]\|,\{1,2\}[^,]\|:\{1,2\}[^:]\|'\{1,2\}[^']\|?\{1,2\}[^?]\|>\{1,2\}[^>]\|<\{1,2\}[^<]\|&\{1,2\}[^&]\||\{1,2\}[^|]\|\~\{1,2\}[^~]\|!\{1,2\}[^!]"me=e-1
autocmd BufNewFile,BufRead * :syntax match Alex_CMacro       "\<[A-Z_][A-Z_0-9]*\>"

" 218=Pink, 214=chocolate2, 208=chocolate, 197=wine-red, 161=crimson, 154=Lime, 117=skyblue3, 81=skyblue, 45=skyblue2, 70=Geen, 33=Function01, 39=Function02
hi Alex_CFunction    ctermfg=39             cterm=bold
hi Alex_CArray       ctermfg=214            cterm=none
hi Alex_CObeject     ctermfg=214            cterm=none
hi Alex_CObejectP    ctermfg=214            cterm=none 
hi Alex_COperator    ctermfg=161            cterm=bold		
hi Alex_CMacro       ctermfg=33             cterm=none

hi Typedef 	     ctermfg=154               cterm=italic
hi Type 	     ctermfg=154               cterm=italic
hi PreCondit         ctermfg=197	       cterm=none

"-------------------------------------------------------
" Highlight Vimdiff
" hi DiffAdd    cterm=none ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" hi DiffDelete cterm=none ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" hi DiffChange cterm=none ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" hi DiffText   cterm=none ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

 hi DiffAdd    cterm=none ctermfg=white ctermbg=17 gui=none guifg=bg guibg=Red
 hi DiffDelete cterm=none ctermfg=white ctermbg=17 gui=none guifg=bg guibg=Red
 hi DiffChange cterm=none ctermfg=10    ctermbg=17 gui=none guifg=bg guibg=Red
 hi DiffText   cterm=none ctermfg=10    ctermbg=88 gui=none guifg=bg guibg=Red

"-------------------------------------------------------
" Highlith Serach 
hi IncSearch    cterm=none ctermbg=red    ctermfg=white  
hi Search       cterm=none ctermbg=green  ctermfg=black
hi MatchParen   cterm=none ctermbg=green  ctermfg=black

"-------------------------------------------------------
" Highlight Others
"
" highlight NonText guibg=#060606
" highlight Folded guibg=#0A0A0A guifg=#9090D0

" hi Type         ctermfg=118 cterm=none
" hi Structure    ctermfg=118 cterm=none
" hi Macro        ctermfg=161 cterm=bold
" hi PreCondit    ctermfg=161 cterm=bold

" hi Keyword         ctermfg=255     ctermbg=210          cterm=bold
" hi cfunctions       ctermfg=118
" hi Type             ctermfg=181 cterm=none
" hi Structure        ctermfg=118 cterm=none
"
" hi Macro            ctermfg=161 
" hi PreCondit        ctermfg=161 cterm=bold
" hi CursorLine       cterm=underline
" highlight String    ctermfg=3
" hi Function  ctermfg=255  ctermbg=210
"
" hi Operator  ctermfg=255  ctermbg=210
" highlight PmenuSel  ctermfg=4   ctermbg=11
" highlight Pmenu     ctermfg=11  ctermbg=4
" highlight Conditional ctermfg=11
" highlight Type      ctermfg=11
" highlight LineNr    ctermfg=255  ctermbg=210
" highlight LineNr    ctermfg=118  ctermbg=0
" highlight Comment   ctermfg=230
" highlight Special   ctermfg=99
" highlight Structure ctermfg=9
" highlight Statement ctermfg=5
" hi Statement       ctermfg=161               cterm=bold
" hi Tag             ctermfg=255
" highlight Constant  ctermfg=1
" highlight StorageClass ctermfg=81
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Customized Color Hightlight End
""""""""""""""""""""""""""""""""""""""""""""""""""""""
