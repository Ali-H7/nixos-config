{ config, pkgs, ... }:

{
  # Enable WireGuard using config file
  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = "/home/ali/Secrets/wg0.conf";
      autostart = false;
    };
  };

}
