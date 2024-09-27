{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    vlc
    cliphist
    imv
    hyprpicker
    fastfetch
    grim
    brightnessctl
    wf-recorder
    ponymix
    slurp
    playerctl
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
