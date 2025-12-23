{
  inputs,
  ...
}:

{
  # make home-manager as a module of nixos
  # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    # TODO replace ryan with your own username

    users.ali = import ../home/home.nix;
    # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix

  };
}
