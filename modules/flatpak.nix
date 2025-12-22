{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  services.flatpak = {
    enable = true;
    packages = [
      "org.jdownloader.JDownloader"
    ];

    update.onActivation = true;
    # Optional: Uninstall flatpaks not listed in this config
    uninstallUnmanaged = true;
  };
}
