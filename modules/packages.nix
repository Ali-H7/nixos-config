{ pkgs, ... }:
{
  programs = {
    dms-shell.enable = true; # /modules/nix
    hyprland.enable = true; # /home/hyprland
  };

  environment.systemPackages = with pkgs; [
    discord
    nautilus
    neovim
    osu-lazer-bin
    papirus-icon-theme
    gnome-boxes # > Virtualization
  ];

  home-manager.users.ali = {
    programs = {
      firefox.enable = true;
      kitty.enable = true;
      vscode.enable = true;
      git.enable = true;
    };

    # --- Music Player ---
    services.mpd.enable = true;
    programs.rmpc.enable = true;

    # --- Hyprland Ecosystem ---
    wayland.windowManager.hyprland.enable = true;
    programs.hyprshot.enable = true;

    # wayland.windowManager.sway.enable = true;
  };

  # --- Virtualization ---
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
