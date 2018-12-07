{ lib, callPackage, neovim, vimUtils, fetchFromGitHub, ... }:

with lib;

let
	build = { owner, repo, rev, sha256, ... }: vimUtils.buildVimPluginFrom2Nix {
		name = repo;
		src = fetchFromGitHub {
			name = repo;
			fetchSubmodules = true;
			leaveDotGit = false;
			inherit owner repo rev sha256;
		};
	};
in neovim.override rec {
	configure = {
		customRC = ''
					let g:install_dir = "${./.}"
					exec "source " . g:install_dir . "/init.vim"
				'';

		packages.myVimPackage.start = map build (callPackage ./plugins {});
	};
}
