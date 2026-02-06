{ config, pkgs, ... }:

{
  # Enable WireGuard using config file
  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = config.secrets.wg0;
      autostart = false;
    };
  };

  environment.interactiveShellInit = ''
    vpn() {
      case "$1" in
        -u|--up)
          sudo systemctl start wg-quick-wg0.service
          ;;
        -d|--down)
          sudo systemctl stop wg-quick-wg0.service
          ;;
        -s|--status)
          systemctl status wg-quick-wg0.service
          ;;
        *)
          echo "Usage: vpn [-u|--up] [-d|--down] [-s|--status]"
          ;;
      esac
    }
  '';
}
