nnoremap <silent> gD <cmd>LspImplementation<CR>
nnoremap <silent> gd <cmd>LspDeclaration<CR>
nnoremap <silent> gr <cmd>LspReferences<CR>
nnoremap <silent> <F2> <cmd>LspRename<CR>

nnoremap <silent> <C-p> <cmd>lua if not pcall(require"telescope.builtin".git_files, {}) then require"telescope.builtin".find_files(opts) end<CR>

nnoremap <silent> <F3> <cmd>NvimTreeToggle<CR>
