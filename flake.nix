{
  description = "Neovim configuration";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.config = nixpkgs.legacyPackages.x86_64-linux.callPackage ./nix { };

    nixosModules.home-manager = { ... }: {
      home.file.".config/nvim".source = self.packages.x86_64-linux.config;
    };
  };
}
