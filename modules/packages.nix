{ pkgs, ... }:
{
  programs = {
    dms-shell.enable = true; # /modules/nix
    hyprland.enable = true; # /home/hyprland
  };

  environment.systemPackages = with pkgs; [
    agenix-cli
    discord
    nautilus
    neovim
    osu-lazer
    papirus-icon-theme
  ];

  home-manager.users.ali = {
    programs = {
      firefox.enable = true;
      kitty.enable = true;
      vscode.enable = true;
      git.enable = true;
    };

    # wayland.windowManager.sway.enable = true;
  };
}
