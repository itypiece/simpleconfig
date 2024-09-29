#  ／|、
# (˙、．7
#  |、～ヽ
#  じしf_,)ノ

{ inputs, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    xwayland = false;
    package = pkgs.sway;
    config = {
      keybindings = import ./__keybindings.nix;
      bars = [
        {
          mode = "invisible";
        }
      ];
      window = {
        border = 0;
        titlebar = false;
      };
      output = {
        "eDP-1" = {
          mode = "2560x1600@60Hz";
          scale = "1.5";
          bg = "${./wallpaper-2.png} fill";
        };
      };
      input = {
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      floating = {
        border = 0;
        titlebar = false;
      };
      gaps = {
        inner = 1;
        outer = 1;
      };
      fonts = {
        names = [ "Sarasa Gothic SC" ];
        size = 10.0;
      };
      startup = [
        { command = "wl-paste --type text --watch cliphist store"; }
        { command = "mako"; }
      ];
      modifier = "Mod4";
    };
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
    systemd.enable = true;
  };
}
