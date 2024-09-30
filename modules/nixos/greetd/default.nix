{
  pkgs,
  lib,
  username,
  ...
}:
{
  security = {
    pam.services.greetd.enableGnomeKeyring = true;
  };

  environment = {
    etc."greetd/environments".text = ''
      Hyprland
    '';
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.cage} -s -- ${lib.getExe pkgs.greetd.gtkgreet} -l";
        user = "${username}";
      };
    };
  };
}
