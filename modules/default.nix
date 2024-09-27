{ username, ... }:
{
  imports = [
    ./nixos
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    users.${username} = import ./home;
  };
}
