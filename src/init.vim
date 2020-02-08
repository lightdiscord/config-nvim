" Option: Basics
syntax enable
set t_Co=256
set number relativenumber
set mouse=a

" Configuration: Gruvbox

set background=dark
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"
colorscheme gruvbox

if (has("termguicolors"))
	set termguicolors
endif

" Option: See hidden chars
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set list

" Configuration: Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Configuration: Airline
let g:airline_theme="gruvbox"

" Configuration: Editorconfig
autocmd bufenter * call editorconfig#load()

map <C-p> :Files<CR>
map <F3> :NERDTree<CR>
map <F4> :LspDocumentDiagnostics<CR>

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 0

highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine
