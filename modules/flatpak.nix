{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    update.onActivation = true;
    uninstallUnmanaged = true;

    packages = [
      "org.jdownloader.JDownloader"
      "com.bitwarden.desktop"
      "io.gitlab.librewolf-community"
    ];

    overrides = {
      "org.jdownloader.JDownloader" = {
        Environment = {
          "_JAVA_AWT_WM_NONREPARENTING" = "1";
        };
      };
    };
  };
}
