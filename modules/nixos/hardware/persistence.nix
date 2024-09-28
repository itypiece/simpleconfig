{ username, ... }:
{
  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos"
      "/var/lib"
      "/var/log"
      "/tmp"
    ];
    files = [ "/etc/machine-id" ];
    users.${username} = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        ".mozilla"
        ".ssh"
        ".gnupg"
      ];
    };
  };
}
