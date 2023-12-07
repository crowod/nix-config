{username, pkgs, ...} @ args:

let
  hostName = "hikari";
in {
  imports = [
    ../../modules/darwin
  ];
  
  networking.hostName = hostName;
  networking.computerName = hostName;
  system.defaults.smb.NetBIOSName = hostName;
  
  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
    shell = pkgs.fish;
  };
  
  nix.settings.trusted-users = [ username ];
}