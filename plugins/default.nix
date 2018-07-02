{ lib, vimUtils, fetchFromGitHub, ... }:

with lib;

let
    builder = vimUtils.buildVimPluginFrom2Nix;
    build = { owner, repo, rev ? "HEAD", name ? repo, sha256 }: builder {
        inherit name;
        src = fetchFromGitHub {
            fetchSubmodules = true;
            inherit name owner repo rev sha256;
        };
    };
in imap0 (_: build) (flatten [
    (import ./ale)
    (import ./ctrlp.vim)
    (import ./editorconfig-vim)
    (import ./nerdtree)
    (import ./rust.vim)
    (import ./vim-airline)
    (import ./vim-fish)
    (import ./vim-fugitive)
    (import ./vim-nix)
    (import ./vim-theme-papaya)
    (import ./vim-toml)
])