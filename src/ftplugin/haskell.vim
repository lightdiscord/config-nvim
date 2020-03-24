if executable('hie-wrapper')
	autocmd User lsp_setup call lsp#register_server({
				\ 'name': 'hie-wrapper',
				\ 'cmd': {server_info->['hie-wrapper', '--lsp']},
				\ 'whitelist': ['haskell'],
				\ })
endif
