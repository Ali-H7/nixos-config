{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.services.desktopManager.plasma6.enable {
    services = {
      xserver.enable = true;
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
          settings = {
            General = {
              DisplayServer = "wayland";
            };
          };
        };
      };
    };

    environment.systemPackages = with pkgs.kdePackages; [
      plasma-browser-integration
      sddm-kcm
    ];

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kate
      elisa
      khelpcenter
      plasma-welcome
      print-manager
    ];
  };
}
