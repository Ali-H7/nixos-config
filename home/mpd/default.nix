{ pkgs, inputs, ... }:
let
  secret = import inputs.secrets;
in
{
  services.mpd = {
    musicDirectory = "/${secret.path}/${secret.hdd2}/${secret.music}";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';

  };
}
