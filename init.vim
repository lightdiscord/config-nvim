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

let g:material_style = "darker"
set background=dark
colorscheme material

lua require("config-nvim-tree")
lua require("my-lsp-config")

set wildignore+=*.o,*.d
set inccommand=split

nnoremap <C-h> :set list!<CR>

