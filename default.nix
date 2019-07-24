{ nixpkgs ? import <nixpkgs> { } }:

with nixpkgs.lib;

let
	build = { owner, repo, rev, sha256, name ? repo, ... }: nixpkgs.vimUtils.buildVimPluginFrom2Nix {
		inherit name;

		src = nixpkgs.fetchFromGitHub {
			fetchSubmodules = true;

			inherit name owner repo rev sha256;
		};
	};
in nixpkgs.neovim.override rec {
	configure = {
		customRC = builtins.readFile ./src/init.vim;

		packages.myVimPackage.start = map build (import ./plugins);
	};
}
