{ config, pkgs, ... }:

{

  programs.dms-shell = {

    systemd = {
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableClipboard = true; # Clipboard history manager
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
  };
}

# -*- Extra Config -*-
#/home/gtk
#/home/hyprland
#/home/kitty
#/modules/nvidia
# -*-
