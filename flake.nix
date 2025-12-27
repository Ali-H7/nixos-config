{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nur = {
      url = "github:nix-community/NUR";
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
      nix-flatpak,
      nur,
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
            ./modules/flatpak.nix
            ./modules/fonts.nix
            ./modules/home-manager.nix
            ./modules/mounts.nix
            ./modules/nvidia.nix
            ./modules/packages.nix
            ./modules/wireguard.nix
            {
              nixpkgs.overlays = [
                inputs.nur.overlays.default # This adds all NUR repos as pkgs.nur.repos.<author>.<package>
              ];
            }
          ]
          ++ (import secrets).docker;
        };
      };
    };
}
