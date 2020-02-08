{ pkgs ? import <nixpkgs> { } }:

with pkgs.lib;

let
	build = { owner, repo, rev, sha256, name ? repo, ... }: pkgs.vimUtils.buildVimPluginFrom2Nix {
		inherit name;

		src = pkgs.fetchFromGitHub {
			fetchSubmodules = true;

			inherit name owner repo rev sha256;
		};
	};
in pkgs.neovim.override {
	withNodeJs = true;

	configure = {
		customRC = builtins.readFile ./src/init.vim;

		packages.myVimPackage.start = map build (import ./plugins);
	};
}
