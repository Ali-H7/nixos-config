{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  services.flatpak = {
    enable = true;
    packages = [
      "org.jdownloader.JDownloader"
      "com.bitwarden.desktop"
      "com.github.tchx84.Flatseal"
      "com.heroicgameslauncher.hgl"
    ];

    update.onActivation = true;
    # Optional: Uninstall flatpaks not listed in this config
    uninstallUnmanaged = true;

  };

  system.activationScripts.jdownloader-java-fix = {
    text = ''
      ${pkgs.flatpak}/bin/flatpak override org.jdownloader.JDownloader --env=_JAVA_AWT_WM_NONREPARENTING=1
    '';
  };

  system.activationScripts.bitwarden-wayland-fix = {
    text = ''
      ${pkgs.flatpak}/bin/flatpak override com.bitwarden.desktop --env=ELECTRON_OZONE_PLATFORM_HINT=wayland
    '';
  };
}
