{
  config,
  pkgs,
  inputs,
  active,
  ...
}:

{
  # TODO please change the username & home directory to your own
  home.username = "ali";
  home.homeDirectory = "/home/ali";

  imports = [
    ./firefox
    ./git
    ./gtk
    ./hyprland
    ./kitty
    ./mouse-cursor
    ./mpd
    ./mpv
    ./qt
    ./vscode
    ./xdg
    #./sway
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #  "Xcursor.size" = 16;
  #  "Xft.dpi" = 172;
  #  };

  # Packages that should be installed to the user profile.
  #home.packages = with pkgs; [
  # here is some command line tools I use frequently
  # feel free to add your own or remove some of them

  #neofetch
  #yazi # terminal file manager

  # archives

  # utils

  # networking tools

  # misc

  # nix related
  #
  # it provides the command `nom` works just like `nix`
  # with more details log output
  #nix-output-monitor

  # productivity

  # system call monitoring

  # system tools
  #];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
