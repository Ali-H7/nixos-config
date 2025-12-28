{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  services.flatpak = {
    enable = true;
    packages = [
      "org.jdownloader.JDownloader"
      "com.bitwarden.desktop"
      "com.github.tchx84.Flatseal"
    ];

    update.onActivation = true;
    # Optional: Uninstall flatpaks not listed in this config
    uninstallUnmanaged = true;
  };
}
