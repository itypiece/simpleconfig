{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
