{ username, ... }: {
  imports = [
    ../base/desktop
    ../base/server
    ./hyprland
    ./desktop
    ./fcitx5
    ./base
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

}
