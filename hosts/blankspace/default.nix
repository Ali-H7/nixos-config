{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
let
  secretPath = /home/ali/Secrets/secrets.nix;
  secretData = import secretPath { inherit lib; };
  secret = config.secrets;
in
{
  imports = [
    ./system.nix
    ./hardware.nix
    ../../modules/nvidia.nix
    ../../modules/wireguard.nix
    secretPath
  ]
  ++ secretData.config.secrets.docker;

  # Enable NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # Mount the partitions
  fileSystems."${secret.m2}" = {
    device = "/dev/disk/by-uuid/4976b77c-6134-427e-b488-a797cdd9e8cf";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  fileSystems."${secret.hdd1}" = {
    device = "/dev/disk/by-uuid/C4A410B7A410ADC4";
    fsType = "ntfs-3g";
    options = [
      "defaults"
      "nofail"
      "uid=1000"
      "gid=100"
      "remove_hiberfile"
    ];
  };

  fileSystems."${secret.hdd2}" = {
    device = "/dev/disk/by-uuid/58A25A56A25A38A8";
    fsType = "ntfs-3g";
    options = [
      "defaults"
      "nofail"
      "uid=1000"
      "gid=100"
      "remove_hiberfile"
    ];
  };
}
