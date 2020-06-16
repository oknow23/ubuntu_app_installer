call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wesleyche/SrcExpl'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-syntax-extra'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'osyo-manga/vim-over'
Plug 'terryma/vim-multiple-cursors'
Plug 'will133/vim-dirdiff'
Plug 'vim-scripts/ifdef-highlighting'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-operator-user'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Plug 'vim-scripts/Conque-GDB'

" cmake {{{
Plug 'vhdirk/vim-cmake'
" }}}

" indent line {{{
Plug 'Yggdroot/indentLine'
" }}}

" targets.vim {{{
Plug 'wellle/targets.vim'
" }}}

" prettier {{{
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
" }}}

" typescript
Plug 'Shougo/vimproc.vim'
" }}}

" golang {{{
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" }}}

" Rust
Plug 'rust-lang/rust.vim'

" VimFiler {{{
" Plug 'Shougo/denite.nvim'
Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimfiler.vim'
" }}}

" Theme {{{
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'xolox/vim-misc'
Plug 'mhartington/oceanic-next'
Plug 'liuchengxu/space-vim-dark'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" Icon {{{
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" }}}


" snippet {{{
Plug 'honza/vim-snippets'
" }}}

" ale {{{
" Plug 'w0rp/ale'
" }}}

" BufOnly {{{
Plug 'vim-scripts/BufOnly.vim'
" }}}

" vim-bookmarks {{{
Plug 'MattesGroeger/vim-bookmarks'
" }}}

" coc.nvim {{{
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" }}}
call plug#end()

set termguicolors

" {{{ deoplete enable
" let g:deoplete#enable_at_startup = 1
" let g:neopairs#enable = 1
" }}}

" --- Key Map ---
" <Leader> & <LocalLeader> mapping {{{
" let maplocalleader= ' '
" let mapleader = ","
let mapleader = "\\"
nnoremap <space> :
" noremap <Leader>qa :quit<CR>
" noremap <Leader>q :q<CR>
" noremap <Leader>w :w<CR>
" inoremap jk <esc>
" " }}}

" let g:ConqueGdb_Leader = '<Leader><Leader>'

" " Copy to clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" " cscope {{{
" set cscopetag
" set csto=0
"
" if filereadable("cscope.out")
"    cs add cscope.out
" elseif $CSCOPE_DB != ""
"     cs add $CSCOPE_DB
" endif
" set cscopeverbose
" " }}}

nmap zzs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zzg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zzc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zzt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap zze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zzf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zzi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zzd :cs find d <C-R>=expand("<cword>")<CR><CR>

" tab {{{
map gn :tabn<CR>
map gp :tabp<CR>
map gl :CtrlSpaceGoDown<cr>
map gh :CtrlSpaceGoUp<cr>
" map	gd :bd<cr>
" tab }}}

" NERDTree {{{
nmap <F9> :NERDTreeToggle<CR>
let NERDTreeWinPos = "left"
" }}}

" tagbar{{{
nmap <F10> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
\ }    
" }}}
"
"nmap <F10> :TlistToggle<CR><CR>
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window = 1
"set ut=100

" fzf {{{
map <C-P> :Files<cr>
" }}}

" airline{{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'

" enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
" }}}

"toggle between no numbers, absolute numbers, and relative numbers {{{
let [&nu, &rnu] = [&nu+&rnu==0, &nu]
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set nu
  else
    set rnu
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>
"}}}

"toggle between nonu/nomouse nu/mouse {{{
let s:enable = 0
function! ToggleCopyMode()
	if s:enable
		set nu
		set mouse=a
        :GitGutterEnable
        :NERDTree
        " :Tagbar
		let s:enable = 0
        :wincmd l
	else
		set nornu
		set nonu
		set mouse-=a
        :GitGutterDisable
        :NERDTreeClose
        " :TagbarClose
		let s:enable = 1
	endif
endfunc

nmap <leader>aa :call ToggleCopyMode()<cr>
"}}}

"My Setting {{{
set nu
set nornu
set mouse=a
syntax on
" syntax enable
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set ff=unix
autocmd VimEnter * NERDTree
" autocmd VimEnter * Tagbar
set autoread
" # for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
" # for js/coffee/jade files, 2 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype coffeescript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype jade setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 expandtab
"nmap <C-S> :w<CR>
" --- split line ---
" if exists('+colorcolumn')
"   set colorcolumn=80
" else
"   au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" endif
set enc=utf-8
set fillchars=vert:\|
" highlight VertSplit ctermbg=100 ctermfg=100
"}}}

" tagbar{{{
nmap <F10> :TagbarToggle<CR>
" }}}

" vim-over{{{
nnoremap [over] <Nop>
xnoremap [over] <Nop>

"map <LocalLeader>o [over]
map <leader>s [over]
nnoremap [over] :OverCommandLine<CR>
"vnoremap \o :OverCommandLine<CR>
vnoremap [over] :OverCommandLine<CR>
nnoremap [over]/ :OverCommandLine /<CR>
" }}}

" NERDcommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
            \ 'c': { 'left': '//' },
            \ 'dts': { 'left': '//' }
            \ }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

" {{{ ctrspace
set nocompatible
set hidden
let g:CtrlSpaceDefaultMappingKey = "<C-L>"
" let g:CtrlSpaceUseTabline = 0
" }}}

" {{{ jsx
" let g:jsx_ext_required = 0
" }}}


" Theme
syntax enable

" " oceanic-next black {{{
" if (has("termguicolors"))
"  set termguicolors
" endif
" syntax enable
" syntax on
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" let g:airline_theme='oceanicnext'
" set background=dark
" colorscheme OceanicNext
" " }}}

" PaperColor {{{
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'
"
" }}}

"hightlight {{{
hi htmlArg gui=italic
hi htmlArg cterm=italic
hi Comment gui=italic
hi Comment cterm=italic
hi Type    gui=italic
hi Type    cterm=italic
" }}}

"devicons {{{
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

set diffopt+=vertical

let s:gui = {}
let s:gui.red          = { 'dark': '#FF5370', 'light': '#E53935' }
let s:gui.dark_red     = { 'dark': '#B71C1C', 'light': '#E53935' }
let s:gui.pink         = { 'dark': '#F07178', 'light': '#FF5370' }
let s:gui.green        = { 'dark': '#C3E88D', 'light': '#91B859' }
let s:gui.teal         = { 'dark': '#004D40', 'light': '#91B859' }
let s:gui.lighter_teal = { 'dark': '#00897B', 'light': '#91B859' }
let s:none=['NONE', 'NONE']
let s:base07=['#555555', '253']
" let s:base07=['#d8dee9', '253']

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  if s:gui(a:guifg) != ""
    exec "hi " . a:group . " guifg=" . s:gui(a:guifg)
  endif
  if s:gui(a:guibg) != ""
    exec "hi " . a:group . " guibg=" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfunction

function! s:gui(color)
  if &background == "light"
    return a:color['light']
  else
    return a:color['dark']
  endif
endfunction

call s:hi("DiffAdd",     "",          s:gui.teal,         "", "", "")
call s:hi("DiffAdded",   s:gui.green, "",                 "", "", "")
call s:hi("DiffChange",  "",          s:gui.teal,         "", "", "")
call s:hi("DiffRemoved", s:gui.red,   "",                 "", "", "")
call s:hi("DiffDelete",  s:gui.red,   s:gui.dark_red,     "", "", "")
call s:hi("DiffText",    "",          s:gui.lighter_teal, "", "", "")



" call <sid>hi('LineNr',                 s:base03, s:base00, '',          '')
" call <sid>hi('SignColumn',             s:base00, s:base00, '',          '')
" call <sid>hi('StatusLine',             s:base01, s:base03, '',          '')
" call s:hi('StatusLineNC',              s:base10, s:none, '',          '','')
call s:hi('VertSplit',                  s:base07,  s:none, '',         '','')

" let g:ale_completion_enabled = 1
" let g:tsuquyomi_completion_detail=1

" vim-prettier {{{
nmap <Leader>py <Plug>(Prettier)
" }}}



" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


""" coc.vim {{{

" let $NVIM_COC_LOG_LEVEL='debug'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gq :CocRestart<cr>
nmap <silent> <F2> <Plug>(coc-rename)
" nn <silent> K :call CocActionAsync('doHover')<cr>

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
" nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
" nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
" nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>
"
" bases
nn <silent> <leader>gb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> <leader>gB :call CocLocations('ccls','$ccls/inheritance',{'levels':5})<cr>
" derived
nn <silent> <leader>gd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> <leader>gD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':5})<cr>

" caller
nn <silent> <leader>gc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> <leader>gC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

nn <silent> <leader>gh :call CocLocations('ccls','$ccls/call',{'hierarchy':v:true,'levels':5})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> <leader>gm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> <leader>gf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> <leader>gs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> <leader>gi <Plug>(coc-type-definition)<cr>
nn <silent> <leader>gv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> <leader>gV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

" Use <c-k> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <c-k> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_snippet_next = '<c-k>'
let g:coc_snippet_prev = '<c-j>'

" if you want to disable auto detect, comment out those two lines
"let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
""" }}}

" :CocInstall coc-tsserver coc-html coc-css coc-vetur coc-pyls coc-highlight coc-emmet coc-snippets
