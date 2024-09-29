{
  description = "Nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence";

    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # For command-not-found
    programsdb = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      impermanence,
      ...
    }:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      formatter.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-rfc-style;
      nixosConfigurations = {
        nixos =
          let
            username = "alice"; # Default password is 1, refer to ./modules/nixos/user/default.nix
            hostname = "nixos";
            platform = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            system = "${platform}";
            specialArgs = {
              inherit
                inputs
                hostname
                username
                ;
            };
            modules = [
              home-manager.nixosModules.home-manager
              impermanence.nixosModules.impermanence
            ] ++ [ ./modules/default.nix ];
          };
      };
    };
}
