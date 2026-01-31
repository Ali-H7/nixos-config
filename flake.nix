{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    secrets = {
      url = "path:/home/ali/Secrets/secret.nix";
      flake = false;
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-flatpak,
      nur,
      vscode-extensions,
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
            ./modules/flatpak.nix
            ./modules/fonts.nix
            ./modules/home-manager.nix
            ./modules/mounts.nix
            ./modules/nvidia.nix
            ./modules/packages.nix
            ./modules/pipewire.nix
            ./modules/plasma.nix
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
