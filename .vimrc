set nocompatible
filetype off
filetype plugin indent off
if has('vim_starting')
  " 初回起動時のみruntimepathにneobundleのパスを指定する
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))
" fetch NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" install plugins
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'chaquotay/ftl-vim-syntax'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'hail2u/vim-css-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'kannokanno/previm'
NeoBundle 'Lokaltog/powerline', {'rtp' : 'powerline/bindings/vim'}
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'millermedeiros/vim-esformatter'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \   },
      \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'sudo.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'wavded/vim-stylus'
call neobundle#end()
filetype plugin indent on

NeoBundleCheck

" PATHの設定
if has('gui_running')
  let $PATH = '/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/share/python:' . $PATH
endif
" 行・列を設定する
set sessionoptions+=resize,tabpages
" ステータスライン
set laststatus=2 " 常にステータスラインを表示
" コマンドをステータスラインに表示する
set showcmd
" コマンドラインの高さ
set cmdheight=1
" 色系の指定
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
call togglebg#map("<F5>")
" シンタックスハイライトを有効にする
syntax on
" 行番号を表示
set number
" 対応括弧の強調は0.3秒
set matchtime=3
" 折りたたみ有効
set foldmethod=marker
"nnoremap <Esc><Esc> :nohlsearch<CR>
" 折り返しあり
set wrap
" タブとか改行を表示する
set list
" タブとか改行を示す文字列
set listchars=eol:¬,tab:▸\ ,extends:>,precedes:<,trail:-
" タブを空白で入力する
set expandtab
" 標準タブは4
set tabstop=2
set softtabstop=2
set shiftwidth=2
" 自動的にインデントする
set autoindent
set smartindent
set indentexpr
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" パフォーマンス対策
if !has('gui_running')
  set lazyredraw
  set ttyfast
endif
" 全角スペースをハイライト
if has("syntax")
  syntax on
  function! ActivateInvisibleIndicator()
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Cyan guibg=Cyan
    "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=Red
    "syntax match InvisibleTab "\t" display containedin=ALL
    "highlight InvisibleTab term=underline ctermbg=Cyan guibg=Cyan
  endf
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif
" カーソルの回り込みを可能にする
"set whichwrap=b,s,[,],<,>
" ヤンクをクリップボードへ送り込む
set clipboard=unnamed
"編集中でもバッファを切り替えれるようにしておく
set hidden
" ルーラーを表示
set ruler
" タイトルをセットする
set title
"バックアップの場所
set backupdir=~/Documents/vimbackup
"swpファイルの場所
set directory=~/Documents/vimbackup
" .vimrcを開く
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
" タブ移動
nnoremap <C-t>l gt
nnoremap <C-t>h gT
" ペイン移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" for ftl syntax
au BufRead,BufNewFile *.ftl set filetype=html.ftl

" for jq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
endfunction

"unite.vim
nnoremap    [unite]   <Nop>
nmap    <Space>f [unite]
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
      \ -buffer-name=files buffer file_mru bookmark file file/new<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
      \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file file/new<CR>

" for vimfiler
call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('txt', 'notepad')
let g:vimfiler_edit_action = 'tabopen'
"noremap <Space>t :VimFiler -split -simple -winwidth=35 -toggle -no-quit<ENTER>

" for NERD-Tree
noremap <Space>t :NERDTreeToggle<CR>
noremap <Space>T :NERDTree<CR>
let NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw = 0

" for neocomplete.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"for javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,angularui,requirejs,jasmine'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularui = 1
autocmd BufReadPre *.js let b:javascript_lib_use_requirejs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 0

" for vim-syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['jshint']

" for tagbar.vim
nnoremap <silent> <F9> :TagbarToggle<CR>

" for vim-json
" ダブルクォート隠しを無効にする
let g:vim_json_syntax_conceal = 0

" JSON beautifier
map <Leader>jb !python -m json.tool<CR>

" for markdown
au BufRead,BufNewFile *.md set filetype=markdown

" for emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \   'lang' : 'ja'
      \ }

" for vim-esformatter
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" for vim-jsdoc.vim
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_default_mapping = 0
nnoremap <silent> ,d :JsDoc<CR>

" for vim-powerline
let g:Powerline_symbols = 'fancy'
