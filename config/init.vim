syntax enable

set number relativenumber
set mouse=a
set background=dark
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set list

if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"
let g:airline_theme="gruvbox"

colorscheme gruvbox

nnoremap <C-p> :Files<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :LspDocumentDiagnostics<CR>

highlight link LspErrorText GruvboxRedSign

