syntax enable
set number
set mouse=a
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set tabstop=4
set shiftwidth=4
set completeopt=menuone,noinsert,noselect
set shortmess+=c

if (has("termguicolors"))
	set termguicolors
endif

" let g:material_style = "lighter"
" set background=light
" colorscheme github_light
" set background=dark
" colorscheme github_dark_high_contrast

lua require("config-nvim-tree")
lua require("my-lsp-config")

set wildignore+=*.o,*.d
set inccommand=split

nnoremap <C-h> :set list!<CR>

