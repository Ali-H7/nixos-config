{
  pkgs,
  lib,
  ...
}:

{
  programs.kitty = {
    settings = {
      confirm_os_window_close = 0;
    };

    # -*- Config for modules/dms -*-
    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf
    '';
    # -*-
  };
}
