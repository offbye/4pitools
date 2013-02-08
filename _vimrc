
" 设置leader为,
let mapleader=","
let g:mapleader=","

" 关闭 vi 兼容模式
set nocompatible
" 自动语法高亮
syntax on
" 检测文件类型
filetype on
" 检测文件类型插件
filetype plugin on
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" 显示行号
set number
" 上下可视行数
set scrolloff=6
" 设定 tab 长度为 4
set tabstop=4
" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
set smarttab
set history=1024
" 不突出显示当前行
set nocursorline
" 覆盖文件时不备份
set nobackup
" 自动切换当前目录为当前文件所在的目录
set autochdir
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 关闭错误声音
set noerrorbells
set novisualbell
set t_vb=

" 不自动换行
"set nowrap
"How many tenths of a second to blink
set mat=2
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
" 智能自动缩进
set smartindent
" 设定命令行的行数为 1
set cmdheight=1
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
"显示括号配对情况
set showmatch

" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
set display=lastline
" 设定配色方案
colorscheme darkblue
" 设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

" 显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl

"blank      空白
"buffers    缓冲区
"curdir     当前目录
"folds      折叠
"help       帮助
"options    选项
"tabpages   选项卡
"winsize    窗口大小
"slash      转换文件路径中的\为/以使session文件兼容unix
"unix       设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" 选中模式 Ctrl+c 复制选中的文本
vnoremap <c-c> "+y
" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @+ = expand('%:p')<cr>

" Shift + Insert 插入系统剪切板中的内容
noremap <S-Insert> "+p
vnoremap <S-Insert> d"+P
inoremap <S-Insert> <esc>"+pa
inoremap <C-S-Insert> <esc>pa

"设置代码折叠方式为 手工  indent
"set foldmethod=indent
"设置代码块折叠后显示的行数
set foldexpr=1

set langmenu=zh_CN.utf8
set termencoding=chinese
set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1
set ambiwidth=double
set guifont=YaHei\ Consolas\ Hybrid:h12


" 删除所有行未尾空格
nnoremap <f12> :%s/[ \t\r]\+$//g<cr>

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Buffers/Tab操作快捷方式!
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
nnoremap <s-j> :tabnext<cr>
nnoremap <s-k> :tabprev<cr>

" 插入模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>
nnoremap <leader>4 :set filetype=php<cr>

