" Load: Config
exec "source " . g:install_dir . "/config.vim"

for file in split(glob(g:install_dir . '/plugins/*/init.vim'), '\n')
 exe 'source' file
endfor
