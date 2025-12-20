# -*- Config for modules/dms -*-
{ pkgs, ... }:

{
  # GTK theme configuration using adw-gtk3 (GNOME Adwaita theme for GTK3/4)
  gtk = {
    enable = true;
    iconTheme.name = "Papirus-Dark";
    # Set the dark variant of adw-gtk3 as the system theme
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    # Import custom color overrides for GTK3 applications
    gtk3.extraCss = ''
      @import url("dank-colors.css");
    '';

    # Import custom color overrides for GTK4 applications
    gtk4.extraCss = ''
      @import url("dank-colors.css");
    '';
  };

  # Force overwrite existing GTK CSS files to ensure custom styles are applied
  xdg.configFile = {
    "gtk-3.0/gtk.css".force = true;
    "gtk-4.0/gtk.css".force = true;
  };
}
# -*-
