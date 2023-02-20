let g:mapleader = " "

nnoremap <silent> gD <cmd>LspImplementation<CR>
nnoremap <silent> gd <cmd>LspDeclaration<CR>
nnoremap <silent> gr <cmd>LspReferences<CR>
nnoremap <silent> <F2> <cmd>LspRename<CR>

" nnoremap <silent> <leader>ff <cmd>lua if not pcall(require"telescope.builtin".git_files, {}) then require"telescope.builtin".find_files(opts) end<CR>
" nnoremap <silent> <c-p> <cmd>lua if not pcall(require"telescope.builtin".git_files, {}) then require"telescope.builtin".find_files(opts) end<CR>
nnoremap <silent> <leader>ff <cmd>lua require"telescope.builtin".find_files(opts)<CR>
nnoremap <silent> <c-p> <cmd>lua require"telescope.builtin".find_files(opts)<CR>

nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>fs <cmd>Telescope lsp_workspace_symbols<CR>
nnoremap <silent> <leader>fr <cmd>Telescope resume<CR>
nnoremap <silent> <leader>fp <cmd>Telescope pickers<CR>

nnoremap <silent> <leader>tt <cmd>NvimTreeToggle<CR>
nnoremap <silent> <leader>tf <cmd>NvimTreeFindFile<CR>
nnoremap <silent> <leader>to <cmd>NvimTreeOpen<CR>
nnoremap <silent> <leader>tc <cmd>NvimTreeClose<CR>

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
