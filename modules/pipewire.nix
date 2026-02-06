{
  config,
  pkgs,
  lib,
  ...
}:

{
  config = lib.mkIf config.services.pipewire.enable {
    boot.kernelParams = [ "preempt=full" ];
    security.rtkit.enable = true;
    services.pipewire = {
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
  };
}
