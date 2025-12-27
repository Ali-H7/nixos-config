{ pkgs, inputs, ... }:
let
  secret = import inputs.secrets;
in
{
  services.mpd = {
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

  services.mpdscribble.endpoints = {
    "last.fm" = {
      passwordFile = "/home/ali/Secrets/last-fm.txt";
      username = secret.lastFmUserName;
    };
  };

  home.file.".config/rmpc/config.ron".source = ./rmpc/config.ron;
  home.file.".config/rmpc/themes/custom.ron".source = ./rmpc/theme.ron;
}
