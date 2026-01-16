{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  secret = import inputs.secrets;
  isEnabled = config.services.mpd.enable;
in
{
  config = lib.mkIf isEnabled {
    services = {
      mpd-mpris.enable = true;

      mpd = {
        musicDirectory = "/${secret.path}/${secret.hdd2}/${secret.music}";
        extraConfig = ''
          audio_output {
            type     "pipewire"
            name     "My PipeWire Output"
          }
          audio_output {
            type     "fifo"
            name     "my_fifo"
            path     "/tmp/mpd.fifo"
            format   "44100:16:2"
          }
        '';
      };

      mpdscribble = {
        enable = true;
        endpoints = {
          "last.fm" = {
            passwordFile = "/home/ali/Secrets/last-fm.txt";
            username = secret.lastFmUserName;
          };
        };
      };
    };

    programs.rmpc.enable = true;
    xdg.configFile = {
      "rmpc/config.ron".source = ./rmpc/config.ron;
      "rmpc/themes/custom.ron".source = ./rmpc/theme.ron;
    };
  };
}
