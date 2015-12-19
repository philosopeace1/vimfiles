 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 NeoBundle 'gregsexton/MatchTag'
 NeoBundle 'Shougo/neocomplete'
 NeoBundle 'Shougo/neosnippet'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/unite-outline'
 NeoBundle 'Shougo/neomru.vim'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'tpope/vim-surround.git'
 NeoBundle 'scrooloose/nerdtree.git'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'godlygeek/tabular'
 NeoBundle 'junegunn/vim-easy-align'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'itchyny/lightline.vim'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'LeafCage/yankround.vim'


 NeoBundle 'vim-ruby/vim-ruby'
 NeoBundle 'vim-scripts/ruby-matchit'
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'basyura/unite-rails'
 NeoBundle 'tpope/vim-haml'
 NeoBundle "slim-template/vim-slim"
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'pangloss/vim-javascript.git'
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'cakebaker/scss-syntax.vim'

 NeoBundle 'sjl/gundo.vim'
 NeoBundle 'mileszs/ack.vim'
 NeoBundle 'rking/ag.vim'


 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


"Basic設定"""""""""""""""""""""""""""""""""""""""
syntax on
":colorscheme elflord
":colorscheme delek
":colorscheme ap_dark8
set autoindent
set showmatch
set hidden
set incsearch
"set list
"set listchars=eol:$,tab:>\ ,extends:<
set listchars=extends:<

highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

highlight Whitespace cterm=underline ctermfg=darkgray guifg=darkgray
"match Whitespace /\s/
autocmd BufRead,BufNew * match Whitespace / /
set number
set tabstop=2
set shiftwidth=2
set smartindent
set smarttab
set expandtab
set ignorecase
set smartcase
set hlsearch
autocmd BufReadPost quickfix set modifiable

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
"以下３行swpファイルの保存場所を指定する
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set tags+=.tags;

vmap <C-c> :w !pbcopy<CR><CR>


"htmlで対応するタグに%でジャンプ
"runtime macros/matchit.vim


if !has('gui_running')
	set t_Co=256
endif


"ファイル・タイプを独自に関連付ける"""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scss set filetype=css

"独自短縮入力"""""""""""""""""""""""""""""""""""""""
iab YDT <C-R>=strftime("%Y-%m-%d %T")<CR>
"iab fe foreach as $k => $v{<CR><TAB><CR><UP><UP><ESC>e<SPACE>i
"iab for for($i = 0;$i<=n;$i++){<CR><TAB>}
"iab pe <?php echo ;?><LEFT><LEFT><LEFT>
imap ,cm <!----><LEFT><LEFT><LEFT>
"inoremap { {}<LEFT>

inoremap [<TAB> []<LEFT>
inoremap [<TAB><TAB> [""]<LEFT><LEFT>
inoremap [[<TAB> [][]<LEFT><LEFT><LEFT>
inoremap [[<TAB><TAB> [""][""]<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap =<TAB> <Space>=<Space>
nnoremap <CR> i<CR><UP><ESC>
map ,y :'s,'ey<CR>
map ,d :'s,'ed<CR>
nnoremap ,q <ESC>:bd<CR>
inoremap <C-O> <ESC>o
inoremap <C-W> <ESC>:w
"nnoremap <C-W> <ESC>:w
inoremap <C-s> <ESC>:w
nnoremap <C-s> <ESC>:w
inoremap <C-CR> <ESC>:bn<CR>

smap  <BS> <BS>i
smap  <CR> <BS>
nnoremap ,sp <ESC>:set paste<CR>i
nnoremap ,snp <ESC>:set nopaste<CR>

inoremap 2<Tab> ""<Left>
inoremap 7<Tab> ''<Left>
inoremap 8<TAB> ()<Left>
inoremap {<TAB> {<CR><CR>}<UP>
"日付の入力補助
"inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
"inoremap <expr> ,dd strftime('%Y-%m-%d')
"inoremap <expr> ,dt strftime('%H:%M:%S')


"行末のスペース削除"
"http://qiita.com/mktakuya/items/2a6cd35ca0c1b217e28c
autocmd BufWritePre * :%s/\s\+$//ge

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
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.vim/snippets'


nnoremap ,sni :NeoSnippetEdit

"unite-outline""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap tt :Unite outline -winwidth=30 -vertical<CR><ESC>
nnoremap ,t :Unite outline -winwidth=30 -vertical<CR><ESC>

"unite.vim""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:unite_split_rule = "righttop"
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable =1
" バッファ一覧
nnoremap ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
" 全部乗せ
nnoremap :: :<C-u>UniteWithBufferDir -buffer-name=files buffer bookmark file -direction=botright -toggle<CR>
nnoremap ;: :<C-u>Unite file_mru<CR>
"ヤンク履歴
nnoremap <C-u><C-y> :Unite -buffer-name=register register<CR>


"easy-motion""""""""""""""""""""""""""""""""""""""""""""""""""
"http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="<SPACE>"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


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
noremap ,nf :NERDTree<CR><C-W><C-W>:NERDTreeFind<CR>
let g:NERDTreeWinSize = 50

"vim-airline""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline#extensions#tabline#enabled = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2


"vim-easy-align""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
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


