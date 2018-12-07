with import <nixpkgs> { };

with lib;

let
	writeLine = file: command: "echo \"${command}\" >> ${file}";
	writeLines = file: commands: concatStringsSep "\n" (map (writeLine file) commands);

	clone = { repo, owner, rev, ... }: writeLines "install.sh" [
		"git clone https://github.com/${owner}/${repo}"
		"cd ${repo}"
		"git reset --hard ${rev}"
		"cd -"
		""
	];
in runCommand "build" {
	nativeBuildInputs = [ git ];
	src = ./..;
} ''
	mkdir -p $out
	cp -R $src/*.vim $src/plugins $out

	cd $out

	touch install.sh

	${ writeLines "install.sh" [
		"#!/usr/bin/env bash"
		"mkdir -p .plugins/pack/repositories/start"
		"cd .plugins/pack/repositories/start"
		""
	] }

	${ concatStringsSep "\n" (map clone (callPackage ../plugins {})) }

	${ writeLine "install.sh" "cd -" }

	chmod u+x install.sh

	# Header part

	touch init.vim.tmp

	${ writeLines "init.vim.tmp" [
		"set nocompatible"

		"set packpath-=~/.vim/after"
		"set packpath+=~/.config/nvim/.plugins"
		"set packpath+=~/.vim/after"

		"filetype indent plugin on | syn on"
	] }

	cat init.vim >> init.vim.tmp
	mv init.vim.tmp init.vim
''
