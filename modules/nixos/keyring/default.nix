{ pkgs, ... }:
{

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  systemd.user.services.hyprland-polkit = {
    description = "hyprland-polkit";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  security.pam.services.hyprlock = { };
  programs.dconf.enable = true;

}
