{
  pkgs,
  lib,
  username,
  ...
}:
{
  security = {
    pam.services.greetd.enableGnomeKeyring = true;
    pam.services.swaylock.text = "auth include login";
  };

  environment = {
    etc."greetd/environments".text = ''
      sway
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
