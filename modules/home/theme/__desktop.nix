{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-compact+rimless,black";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [
          "rimless"
          "black"
        ];
        variant = "mocha";
      };
    };

    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
  };

}
