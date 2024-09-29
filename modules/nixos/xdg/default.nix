{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      config = {
        common = {
          # uses the first portal implementation found in lexicographical order
          default = [ "*" ];
          "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        };
      };

      extraPortals = [
        pkgs.xdg-desktop-portal-wlr
      ];
    };
  };
}
