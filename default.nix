{ lib, callPackage, neovim, vimUtils, fetchFromGitHub, ... }:

with lib;

let
	build = { owner, repo, rev, sha256, ... }: vimUtils.buildVimPluginFrom2Nix {
		name = repo;
		src = fetchFromGitHub {
			name = repo;
			fetchSubmodules = true;
			inherit owner repo rev sha256;
		};
	};
in neovim.override rec {
	configure = {
		customRC = builtins.readFile ./src/init.vim;

		packages.myVimPackage.start = map build (import ./plugins);
	};
}
