{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts # General
    noto-fonts-cjk-sans # Asian characters
    noto-fonts-color-emoji # Emojis
    nerd-fonts.caskaydia-mono
    rubik
    inter
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "CaskaydiaMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
