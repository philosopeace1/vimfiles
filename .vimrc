"neoBundle"""""""""""""""""""""""""""""""""
if 0 | endif
 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif
 call neobundle#begin(expand('~/.vim/bundle/'))
 NeoBundleFetch 'Shougo/neobundle.vim'

 NeoBundle 'Shougo/neocomplete'
 NeoBundle 'Shougo/neosnippet'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'Shougo/neomru.vim'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/unite-outline'

 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'tpope/vim-surround.git'
 NeoBundle 'scrooloose/nerdtree.git'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'junegunn/vim-easy-align'
 NeoBundle 'itchyny/lightline.vim'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'LeafCage/yankround.vim'

 NeoBundle 'sjl/gundo.vim'
 NeoBundle 'rking/ag.vim'

 "Programing Language
 "ruby
 NeoBundle 'vim-ruby/vim-ruby'
 NeoBundle 'vim-scripts/ruby-matchit'
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'basyura/unite-rails'
 "other
 NeoBundle "slim-template/vim-slim"
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'pangloss/vim-javascript.git'
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'cakebaker/scss-syntax.vim'
 NeoBundle 'gregsexton/MatchTag'

 call neobundle#end()

filetype plugin indent on
NeoBundleCheck

"Basic設定"""""""""""""""""""""""""""""""""""""""
syntax on
set autoindent
set showmatch
set hidden
set incsearch
set list
set listchars=tab:^\ ,trail:@
set listchars=extends:<
set number
set tabstop=2
set shiftwidth=2
set smartindent
set smarttab
set expandtab
set ignorecase
set smartcase
set hlsearch
set modifiable
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
"以下３行swpファイルの保存場所を指定する
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set tags+=.tags;

if !has('gui_running')
	set t_Co=256
endif

highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

highlight Whitespace cterm=underline ctermfg=darkgray guifg=darkgray
"match Whitespace /\s/
autocmd BufRead,BufNew * match Whitespace / /
"autocmd BufReadPost quickfix set modifiable

"行末のスペース削除"
"http://qiita.com/mktakuya/items/2a6cd35ca0c1b217e28c
autocmd BufWritePre * :%s/\s\+$//ge

:autocmd BufWinEnter * setlocal modifiable

"ファイル・タイプを独自に関連付ける"""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scss set filetype=css

"独自短縮入力"""""""""""""""""""""""""""""""""""""""
nnoremap ,q <ESC>:bd<CR>
inoremap <C-s> <ESC>:w<CR>i
nnoremap <C-s> <ESC>:w<CR>

nnoremap ,sp <ESC>:set paste<CR>i
nnoremap ,snp <ESC>:set nopaste<CR>
nnoremap ,sm <Esc>:set modifiable<CR>

inoremap 2<Tab> ""<Left>
inoremap 7<Tab> ''<Left>
inoremap 8<TAB> ()<Left>
inoremap {<TAB> {<CR><CR>}<UP>

"--------------------------------------------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
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

"--------------------------------------------------------------------------
" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.vim/snippets'
nnoremap ,sni :NeoSnippetEdit

"unite.vim""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:unite_split_rule = "righttop"
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable =1
" バッファ一覧
nnoremap ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
nnoremap ;f :<C-u>Unite buffer -direction=botright -auto-resize -toggle<ESC><CR>
" 全部乗せ
nnoremap :: :<C-u>UniteWithBufferDir -buffer-name=files buffer bookmark file -direction=botright -toggle<CR>
nnoremap ;: :<C-u>Unite file_mru<CR>
"ヤンク履歴
nnoremap <C-u><C-y> :Unite -buffer-name=register register<CR>

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

"vim-javascript""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/pangloss/vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"easy-motion""""""""""""""""""""""""""""""""""""""""""""""""""
"http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="<SPACE>"
" 1 ストローク選択を優先する
"let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
nmap <SPACE>s <Plug>(easymotion-s2)

"unite-rails""""""""""""""""""""""""""""""""""""""""""""""""""
noremap ,c :<C-u>Unite rails/controller<CR>
noremap ,rc :<C-u>Unite rails/controller<CR>
noremap ,m :<C-u>Unite rails/model<CR>
noremap ,rm :<C-u>Unite rails/model<CR>
noremap ,v :<C-u>Unite rails/view<CR>
noremap ,rv :<C-u>Unite rails/view<CR>
noremap ,h :<C-u>Unite rails/helper<CR>
noremap ,rh :<C-u>Unite rails/helper<CR>
noremap ,j :<C-u>Unite rails/javascript<CR>
noremap ,rj :<C-u>Unite rails/javascript<CR>
noremap ,s :<C-u>Unite rails/stylesheet<CR>
noremap ,rs :<C-u>Unite rails/stylesheet<CR>
noremap ,cf :<C-u>Unite rails/config<CR>

"coffe-script""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ,cc <ESC>:CoffeeCompile vert <CR><C-w><C-W>
nnoremap ,ccc <ESC><C-w><C-W>:bd <CR>

"NerdTree""""""""""""""""""""""""""""""""""""""""""""""""""
noremap ,, :NERDTreeToggle<CR>
map ,nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 50
let NERDSpaceDelims = 1

"vim-easy-align""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"yankround""""""""""""""""""""""""""""""""""""""""""""""""""
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"ag.vim""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

"unite outline""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ,t :Unite -vertical -direction=botright -winwidth=50 -no-start-insert outline<CR>

"ruby matchit""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"#nnoremap ,e <ESC>:w<ESC>SyntasticCheck<CR> :SyntasticToggleMode<CR>
nnoremap ,e :w<CR>:SyntasticCheck<CR>
