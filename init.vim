" Setup: Dein
let g:dein#disabled = get(g:, 'dein#disabled', 0)

if !g:dein#disabled
 source ~/.config/nvim/dein.vim
endif

" Load: Config
source ~/.config/nvim/config.vim

for file in split(glob('~/.config/nvim/plugins/*/init.vim'), '\n')
 exe 'source' file
endfor
