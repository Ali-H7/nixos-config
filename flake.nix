{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "path:/home/ali/Secrets/secret.nix";
      flake = false;
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      secrets,
      ...
    }:
    {
      nixosConfigurations = {
        blankspace = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
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
