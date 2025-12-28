{ pkgs, ... }:

let
  cursorName = "Simp1e-Catppuccin-Latte";
  cursorSize = 24;
in
{
  home.pointerCursor = {
    package = pkgs.simp1e-cursors;
    name = cursorName;
    size = cursorSize;

    enable = true;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = toString cursorSize;
  };

  home.packages = [ pkgs.simp1e-cursors ];
}
