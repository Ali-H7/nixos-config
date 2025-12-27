{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.firefox = {
    languagePacks = [ "en-US" ];

    policies = {
      DisableTelemetry = true;

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # -*- Config for modules/dms (pywalfox) -*-
        "pywalfox@frewacom.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/pywalfox/latest.xpi";
          installation_mode = "force_installed";
        };
        # -*-
      };
    };
  };
  # -*- (pywalfox)
  home.file.".cache/wal/colors.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.cache/wal/dank-pywalfox.json";
  # -*-
}
