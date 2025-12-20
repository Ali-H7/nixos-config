{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        blankspace = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hardware.nix
            ./system.nix
            ./modules/dms.nix
            ./modules/fonts.nix
            ./modules/home-manager.nix
            ./modules/mounts.nix
            ./modules/nvidia.nix
            ./modules/packages.nix
          ];
        };
      };
    };
}
