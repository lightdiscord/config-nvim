syntax enable
set number relativenumber
set mouse=a
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set tabstop=4
set shiftwidth=4
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set hidden

if (has("termguicolors"))
	set termguicolors
endif

packadd github-nvim-theme
colorscheme github_dark_default
set background=dark

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=25
let g:netrw_dirhistmax=0

lua require("my-lsp-config")

set wildignore+=*.o,*.d
let NERDTreeRespectWildIgnore=1

imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

set inccommand=split

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <C-h> :set list!<CR>

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
