{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    package = null;
    portalPackage = null;

    settings = {
      # --- Variables ---
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";

      # --- Environment Variables ---
      env = [
        # -*- Config for modules/dms -*-
        #"QT_QPA_PLATFORMTHEME,qt6ct"
        #"QT_QPA_PLATFORMTHEME_QT6,qt6ct"
        # -*-
        # -*- Config for modules/nvidia -*-
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "LIBVA_DRIVER_NAME,nvidia"
        # -*-
        # -*- Config for home/hyprcursor -*-
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,macOS"
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,macOS"
        # -*-
        "QT_QPA_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

      # --- Monitors ---
      monitor = [
        "DP-2, 1920x1080@165, 0x447, 1"
        "HDMI-A-2, 1920x1080@60, 1920x0, 1, transform, 3"
      ];

      workspace = [
        "1, monitor:DP-2, default:true"
        "2, monitor:HDMI-A-2, default:true"
      ];

      # --- Input ---
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        accel_profile = "flat";
      };

      # --- General Layout ---
      general = {
        gaps_in = 8;
        gaps_out = 8;
        border_size = 2;
        layout = "dwindle";
        resize_on_border = true;
        hover_icon_on_border = true;
      };

      # --- Decoration ---
      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        shadow = {
          enabled = true;
          range = 30;
          render_power = 5;
          offset = "0 5";
          color = "rgba(00000070)";
        };
        blur = {
          enabled = true;
          size = 5;
          passes = 4;
          ignore_opacity = true;
          xray = true;
          new_optimizations = true;
        };
      };

      # --- Misc Settings ---
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      # --- Keybindings ---
      bind = [
        # Essentials
        "$mainMod, W, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen,"

        # Screenshot
        "$mainMod, S, exec, hyprshot -m output -o ~/Pictures/Screenshots"
        "$mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots"
        "$mainMod CONTROL, S, exec, hyprshot -m window -o ~/Pictures/Screenshots"
        # DMS Application Launchers
        "$mainMod, A, exec, dms ipc call spotlight toggle"
        "$mainMod, V, exec, dms ipc call clipboard toggle"
        "$mainMod, M, exec, dms ipc call processlist focusOrToggle"
        "$mainMod, comma, exec, dms ipc call settings focusOrToggle"
        "$mainMod, N, exec, dms ipc call notifications toggle"
        "$mainMod, Y, exec, dms ipc call dankdash wallpaper"
        "$mainMod, TAB, exec, dms ipc call hypr toggleOverview"

        # Security
        "$mainMod ALT, L, exec, dms ipc call lock lock"

        # Navigation
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move to Workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special Workspace
        #"$mainMod, S, togglespecialworkspace, magic"
        #"$mainMod SHIFT, S, movetoworkspace, special:magic"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Multimedia (Strictly DMS)
      bindel = [
        ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
        ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
        ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5"
        ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5"
      ];

      bindl = [
        ", XF86AudioMute, exec, dms ipc call audio mute"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Startup
      exec-once = [
        "wl-paste --watch cliphist store"
      ];
    };
  };
}
