{ username, ... }:
{

  users.users.${username} = {
    password = "1";
    # generated hashedPassword by command mkPasswd
    # hashedPassword = "$y$j9T$nNg2yQ3eADfg4R8YDVd1S0$rshQwNOVdsHGSp6h1ZnhbkL96A5yJX9.G3zqOU7esh3";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

}
