{ pkgs, inputs, ... }:
{
  imports = [ inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger ];

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-rosewater-compact+rimless,black";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "rosewater" ];
        size = "compact";
        tweaks = [
          "rimless"
          "black"
        ];
        variant = "macchiato";
      };
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 22;
    gtk.enable = true;
  };
  programs.hyprcursor-phinger.enable = true;
}
