# ./modules/common.nix
{ inputs, ... }:

{
  imports = [
    ./flatpak.nix
    ./fonts.nix
    ./home-manager.nix
    ./packages.nix
    ./pipewire.nix
    ./plasma.nix
    {
      nixpkgs.overlays = [ inputs.nur.overlays.default ];
    }
  ];
}