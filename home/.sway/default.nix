{
  pkgs,
  lib,
  active,
  ...
}:
{

  home.packages = with pkgs; [
    foot
    autotiling # Autotiling Script
  ];

  wayland.windowManager.sway = {
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps

    config = {

      # Variables
      modifier = "Mod4";
      terminal = "foot";

      output = {
        # Main Monitor (KTC)
        "DP-2" = {
          mode = "1920x1080@165Hz";
          pos = "0 447";
        };
        # Side Monitor (ViewSonic)
        "HDMI-A-2" = {
          mode = "1920x1080@60Hz";
          pos = "1920 0";
          transform = "90";
        };
      };

      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
      };

      # Startup Commands
      startup = [
        {
          command = "autotiling";
          always = true;
        } # exec_always autotiling
        { command = "dms run"; } # exec dms run
      ];

      # Keybindings
      keybindings =
        let
          mod = "Mod4";
          left = "h";
          down = "j";
          up = "k";
          right = "l";
        in
        lib.mkOptionDefault {
          # Basics
          "${mod}+Return" = "exec foot";
          "${mod}+Shift+q" = "kill";
          "${mod}+d" = "exec wmenu-run";
          "${mod}+Shift+c" = "reload";

          # Moving focus
          "${mod}+${left}" = "focus left";
          "${mod}+${down}" = "focus down";
          "${mod}+${up}" = "focus up";
          "${mod}+${right}" = "focus right";

          # Moving containers
          "${mod}+Shift+${left}" = "move left";
          "${mod}+Shift+${down}" = "move down";
          "${mod}+Shift+${up}" = "move up";
          "${mod}+Shift+${right}" = "move right";

          # Layout and Window control
          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen";
          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+a" = "focus parent";
          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";
          "${mod}+r" = "mode resize";

        };

      # Resize Mode
      modes.resize = {
        "h" = "resize shrink width 10px";
        "j" = "resize grow height 10px";
        "k" = "resize shrink height 10px";
        "l" = "resize grow width 10px";
        "Left" = "resize shrink width 10px";
        "Down" = "resize grow height 10px";
        "Up" = "resize shrink height 10px";
        "Right" = "resize grow width 10px";
        "Return" = "mode default";
        "Escape" = "mode default";
      };

      # Appearance and Gaps
      window.border = 2; # default_border pixel 2
      window.titlebar = false;
      gaps = {
        inner = 8;
        outer = 8;
      };

      bars = [ ]; # Status bar disabled
    };
  };
}
