set nocompatible
filetype off
filetype plugin indent off


" dein.vimの初期化
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')

call dein#add('altercation/vim-colors-solarized')
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('chaquotay/ftl-vim-syntax')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('darfink/vim-plist')
call dein#add('digitaltoad/vim-jade')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('elzr/vim-json')
call dein#add('fatih/vim-go')
call dein#add('hail2u/vim-css-syntax')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('heavenshell/vim-jsdoc')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('kannokanno/previm')
call dein#add('lambdalisue/vim-pyenv')
call dein#add('majutsushi/tagbar')
call dein#add('mattn/jscomplete-vim')
call dein#add('mattn/emmet-vim')
call dein#add('millermedeiros/vim-esformatter')
call dein#add('mxw/vim-jsx')
"call dein#add('OmniSharp/omnisharp-vim', {
"      \   'build': {
"      \     'windows' : 'msbuild server/OmniSharp.sln',
"      \     'mac': 'xbuild server/OmniSharp.sln',
"      \     'unix': 'xbuild server/OmniSharp.sln',
"      \   },
"      \ })
call dein#add('othree/html5.vim')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('plasticboy/vim-markdown')
call dein#add('pmsorhaindo/syntastic-local-eslint.vim')
call dein#add('posva/vim-vue')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/vimshell')
call dein#add('vim-scripts/sudo.vim')
call dein#add('Townk/vim-autoclose')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-surround')
call dein#add('tyru/open-browser.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('wavded/vim-stylus')
call dein#add('hokaccha/vim-html5validator')

call dein#end()

filetype plugin indent on
syntax enable

" PATHの設定
if has('gui_running')
  let $PATH = '/usr/local/sbin:/usr/local/bin:' .
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
" markdownの折りたたみなし
let g:vim_markdown_folding_disabled=1
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
set indentexpr=
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
set backupdir=$HOME/.vim/backup
"swpファイルの場所
set directory=$HOME/.vim/backup
" .vimrcを開く
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
" sudoでhostsを開く
nnoremap <Space>h :<C-u>edit sudo:/etc/hosts<CR>
" tomcatのapp.logを開く
nnoremap <Space>m :<C-u>edit /usr/local/tomcat/logs/app/app.log<CR>
" タブ移動
nnoremap <C-t>l gt
nnoremap <C-t>h gT
" ペイン移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" for ctags
nnoremap <Space>j :exe("tjump ".expand('<cword>'))<CR> :split<CR>

" for ftl syntax
autocmd BufRead,BufNewFile *.ftl set filetype=html.ftl

" for vue syntax
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
"
" for jsx syntax
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx

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
let g:OmniSharp_selector_ui = 'unite'

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

"for javascript-libraries-syntax
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,angularui,requirejs,jasmine,react,flux'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularui = 1
autocmd BufReadPre *.js let b:javascript_lib_use_requirejs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_flux = 1

" for vim-syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_scss_checkers = ['stylelint']

" for tagbar.vim
nnoremap <silent> <F9> :TagbarToggle<CR>

" for vim-json
" ダブルクォート隠しを無効にする
let g:vim_json_syntax_conceal = 0

" JSON beautifier
map <Leader>jb !python -m json.tool<CR>

" for markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:vim_markdown_folding_disable=1

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
