if &compatible
 set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

 for file in split(glob('~/.config/nvim/plugins/*/dein.vim'), '\n')
  exe 'source' file
 endfor

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
 call dein#install()
endif
