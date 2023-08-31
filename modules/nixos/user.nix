{ username, ... }:
{
  nix.settings.trusted-users = [ username ];

  users.users."${username}" = {
    home = "/home/${username}";
    isNormalUser = true;
    description = username;
    extraGroups = [
      username
      "users"
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];
  };
}
