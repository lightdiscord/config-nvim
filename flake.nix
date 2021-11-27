{
  description = "Neovim related packages";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.neovim.url = "github:neovim/neovim/master?dir=contrib";

  outputs = { self, nixpkgs, neovim }: {
    packages.x86_64-linux.neovim = neovim.defaultPackage.x86_64-linux;

    packages.x86_64-linux.tree-sitter-parsers =
      nixpkgs.legacyPackages.x86_64-linux.tree-sitter.withPlugins (packages: with packages; [
        tree-sitter-bash
        tree-sitter-c
        tree-sitter-cpp
        tree-sitter-css
        tree-sitter-html
        tree-sitter-javascript
        tree-sitter-json
        tree-sitter-markdown
        tree-sitter-nix
        tree-sitter-php
        tree-sitter-python
      ]);

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.neovim;
  };
}
