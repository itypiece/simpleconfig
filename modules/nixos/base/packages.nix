{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vim
    killall
    zip
    unzip
    git
    screen
    wget
    iputils
    usbutils
    utillinux
    binutils
    cage
    coreutils
    whois
    curl
    greetd.gtkgreet
  ];

  programs.hyprland.enable = true;

}
