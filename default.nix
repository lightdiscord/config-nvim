{ callPackage, neovim, ... }:

neovim.override {
    configure = {
        customRC = ''
            let g:dein#disabled = 1
            source ${builtins.getEnv "HOME"}/.config/nvim/init.vim
        '';

        packages.myVimPackage.start = (callPackage ~/.config/nvim/plugins {});
    };
}
