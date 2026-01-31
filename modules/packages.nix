{
  pkgs,
  inputs,
  lib,
  ...
}:
let
  secret = import inputs.secrets;
in
{
  services.desktopManager.plasma6.enable = true;

  programs = {
    steam.enable = true;
    gamescope.enable = true;
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    discord
    neovim
    osu-lazer-bin
    telegram-desktop
    gnome-boxes # > Virtualization
    protonvpn-gui
    picard
    puddletag
    freac
    fooyin
    ffmpeg-full
    qbittorrent
    heroic
    lsfg-vk
    lsfg-vk-ui
    nur.repos.nltch.spotify-adblock
  ];

  home-manager.users.ali = {
    programs = {
      firefox.enable = true;
      vscode.enable = true;
      git.enable = true;
      mpv.enable = true;
    };
  };

  # --- Virtualization ---
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };
}
