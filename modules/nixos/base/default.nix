{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./packages.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  users.mutableUsers = lib.mkDefault false;

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  # i18n.extraLocaleSettings = {
  #  LC_ADDRESS = "fr_FR.UTF-8";
  #  LC_IDENTIFICATION = "fr_FR.UTF-8";
  #  LC_MEASUREMENT = "fr_FR.UTF-8";
  #  LC_MONETARY = "fr_FR.UTF-8";
  #  LC_NAME = "fr_FR.UTF-8";
  #  LC_NUMERIC = "fr_FR.UTF-8";
  #  LC_PAPER = "fr_FR.UTF-8";
  #  LC_TELEPHONE = "fr_FR.UTF-8";
  #  LC_TIME = "fr_FR.UTF-8";
  # };

  # Configure console keymap
  # console.keyMap = "fr";

  programs.command-not-found.dbPath =
    inputs.programsdb.packages.${pkgs.stdenv.hostPlatform.system}.programs-sqlite;

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    channel.enable = false;
    settings = {
      sandbox = true;

      experimental-features = [
        "auto-allocate-uids"
        "ca-derivations"
        "flakes"
        "no-url-literals"
        "nix-command"
        "parse-toml-timestamps"
        "read-only-local-store"
        "recursive-nix"
      ];

      commit-lockfile-summary = "chore: Update flake.lock";
      accept-flake-config = true;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      warn-dirty = false;

      trusted-users = [
        "root"
        "@wheel"
      ];
      allowed-users = [ "@wheel" ];

      substituters = [
        "https://nix-community.cachix.org?priority=43"
        "https://cache.garnix.io?priority=60"
      ];

      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    registry = {
      system.flake = inputs.nixpkgs;
      default.flake = inputs.nixpkgs;
      nixpkgs.flake = inputs.nixpkgs;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };
    optimise.automatic = true;
  };

  services = {
    # Service that makes Out of Memory Killer more effective
    earlyoom.enable = true;
    dbus.packages = [ pkgs.gcr ];
    timesyncd.enable = true;
    # Enable periodic SSD TRIM of mounted partitions in background
    fstrim.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
    logind = {
      powerKey = "suspend";
      lidSwitch = "suspend-then-hibernate";
    };
  };
  documentation = {
    enable = false;
    doc.enable = false;
    nixos.enable = false;
    man.enable = true;
    dev.enable = false;
  };

}
