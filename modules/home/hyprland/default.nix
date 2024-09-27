{
  pkgs,
  ...
}:
{
  imports = [
    ./__hyprpaper.nix
    ./__hyprpaper.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    # xwayland = {
    #   enable = true;
    #  };
    settings = {
      exec-once = [
        "hyprpaper"
        "wl-paste --type text --watch cliphist store"
      ];

      monitor = [
        ",highrr,auto,1"
      ];

      animations = {
        enabled = true;

        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "windowsMove, 1, 2, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        force_split = 2;
        pseudotile = true;
        preserve_split = true;
        no_gaps_when_only = 0;
      };

      decoration = {
        rounding = 0;

        dim_inactive = false;
        dim_strength = 0.7;

        blur = {
          enabled = false;
          size = 2;
          passes = 2;
          vibrancy = 0.4;
          new_optimizations = true;
          ignore_opacity = true;
          xray = true;
          special = true;
        };

        drop_shadow = false;
        shadow_range = 8;
        shadow_render_power = 3;
        shadow_offset = "2 2";
      };

      general = {
        gaps_in = 3;
        gaps_out = 3;
        border_size = 2;

        layout = "dwindle";
      };

      group = {
        groupbar = {
          render_titles = false;
        };
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        repeat_rate = 30;
        repeat_delay = 300;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = false;
        vfr = true;
        vrr = 0;
      };

      layerrule = [
        "blur, notifications"
        "blur, launcher"
        "blur, lockscreen"
        "ignorealpha 0.69, notifications"
        "ignorealpha 0.69, launcher"
        "ignorealpha 0.69, lockscreen"
      ];

      windowrulev2 = [
        "float, class:^(xdg-desktop-portal-gtk)$,title:^(Open Files)$"
        "noblur, class:^(waybar)$"
        "noblur, class:^(firefox)$"
        "noblur, class:^(Chromium-browser)$" # xwayland
        "noblur, class:^(chromium-browser)$" # wayland
        "noblur, title:^(.*(Disc|WebC)ord.*)$"
        "noblur, title:^(Open File)$"
        "noshadow, class:^(firefox)$"
        "noshadow, class:^(Chromium-browser)$" # xwayland
        "noshadow, class:^(chromium-browser)$" # wayland
        "noshadow, title:^(.*(Disc|WebC)ord.*)$"
        "noanim, class:^(wlogout)$"
      ];

      "$mod" = "SUPER";
      bind = [
        "$mod SHIFT, C , exit ,"
        "$mod      , Q, togglespecialworkspace"
        "$mod SHIFT, Q, movetoworkspace, special"
        "$mod      , F , fullscreen , 0"
        "$mod      , R , exec , fuzzel -I"
        "$mod      , Space , togglefloating ,"
        "$mod SHIFT, T , togglegroup ,"
        "$mod SHIFT, J , changegroupactive, f"
        "$mod SHIFT, K , changegroupactive, b"
        "$mod      , W , killactive ,"
        "$mod      , P , exec , wlogout"
        "$mod      , Return , exec , foot"

        "$mod SHIFT, S , exec , grim-g \"$(slurp)\" $HOME/Pictures/$(date '+%Y_%m_%d_%H_%M_%S').png"
        "$mod SHIFT, R , exec , wf-recorder -g \"$(slurp)\" --audio --file=$HOME/Videos/$(date '+%Y_%m_%d_%H_%M_%S').mp4"

        "$mod      , L , exec , hyprlock"
        # Dwindle Keybind
        "$mod , k , movefocus , u"
        "$mod , j , movefocus , d"

        "$mod , left , movewindow , l"
        "$mod , right , movewindow , r"
        "$mod , up , movewindow , u"
        "$mod , down , movewindow , d"
        "$mod SHIFT , h , movewindow , l"
        "$mod SHIFT , l , movewindow , r"
        "$mod SHIFT , k , movewindow , u"
        "$mod SHIFT , j , movewindow , d"

        "$mod , 1 , workspace , 1"
        "$mod , 2 , workspace , 2"
        "$mod , 3 , workspace , 3"
        "$mod , 4 , workspace , 4"
        "$mod , 5 , workspace , 5"
        "$mod , 6 , workspace , 6"
        "$mod , 7 , workspace , 7"
        "$mod , 8 , workspace , 8"
        "$mod , 9 , workspace , 9"
        "$mod , 0 , workspace , 10"

        "$mod SHIFT , 1 , movetoworkspacesilent , 1"
        "$mod SHIFT , 2 , movetoworkspacesilent , 2"
        "$mod SHIFT , 3 , movetoworkspacesilent , 3"
        "$mod SHIFT , 4 , movetoworkspacesilent , 4"
        "$mod SHIFT , 5 , movetoworkspacesilent , 5"
        "$mod SHIFT , 6 , movetoworkspacesilent , 6"
        "$mod SHIFT , 7 , movetoworkspacesilent , 7"
        "$mod SHIFT , 8 , movetoworkspacesilent , 8"
        "$mod SHIFT , 9 , movetoworkspacesilent , 9"
        "$mod SHIFT , 0 , movetoworkspacesilent , 10"

        ", XF86AudioNext , exec , ${pkgs.playerctl}/bin/playerctl next"
        ", XF86AudioPrev , exec , ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioPlay , exec , ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPause , exec , ${pkgs.playerctl}/bin/playerctl pause"
        ", XF86AudioStop , exec , ${pkgs.playerctl}/bin/playerctl stop"
      ];

      binde = [
        ", XF86AudioRaiseVolume , exec , ${pkgs.alsa-utils}/bin/amixer -q set Master 5%+"
        ", XF86AudioLowerVolume , exec , ${pkgs.alsa-utils}/bin/amixer -q set Master 5%-"

        ", XF86MonBrightnessUp , exec , ${pkgs.brightnessctl}/bin/brightnessctl set 5%+"
        ", XF86MonBrightnessDown , exec , ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
      ];

      bindm = [
        "$mod , mouse:272 , movewindow"
        "$mod , mouse:273 , resizewindow"
      ];

      xwayland.force_zero_scaling = true;
    };
  };
}
