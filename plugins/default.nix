{ lib, ... }:

with lib;

(flatten [
	(import ./ale)
	(import ./ctrlp.vim)
	(import ./nerdtree)
	(import ./rust.vim)
	(import ./vim-airline)
	(import ./vim-editorconfig)
	(import ./vim-fish)
	(import ./vim-fugitive)
	(import ./vim-nix)
	(import ./vim-theme-papaya)
	(import ./vim-toml)
])
