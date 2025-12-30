{ pkgs, inputs, ... }:
let
  secret = import inputs.secrets;
in
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
    ffmpegthumbnailer # Video thumbnails for file managers
    protonvpn-gui
    qimgv
    picard
    puddletag
    freac
    fooyin
    pywalfox-native # > DMS
    nur.repos.nltch.spotify-adblock
  ];

  home-manager.users.ali = {
    programs = {
      firefox.enable = true;
      librewolf.enable = true;
      kitty.enable = true;
      vscode.enable = true;
      git.enable = true;
      mpv.enable = true;
    };

    # --- Music Player ---
    services.mpd.enable = true;
    programs.rmpc.enable = true;
    services.mpd-mpris.enable = true;
    services.mpdscribble.enable = true;

    # --- Hyprland Ecosystem ---
    wayland.windowManager.hyprland.enable = true;
    programs.hyprshot.enable = true;

    # wayland.windowManager.sway.enable = true;
  };

  # --- Virtualization ---
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.docker.enable = true;
}
