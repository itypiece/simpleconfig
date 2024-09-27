{ lib, hostname, ... }:
{
  networking = {
    hostName = "${hostname}";
    wireless.iwd.enable = lib.mkDefault true;
    useDHCP = lib.mkDefault true;
    enableIPv6 = lib.mkDefault false;
    # networkmanager.dns = "1.1.1.1";
  };
}
