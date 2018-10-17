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
        customRC = "source ${builtins.getEnv "HOME"}/.config/nvim/init.vim";

        packages.myVimPackage.start = map build (callPackage ./plugins {});
    };
}
