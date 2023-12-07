{ username, lib, ... }: {

  imports = [
    ../base/server/neovim
    ../base/server/fish.nix
    ../base/server/tmux.nix
    ../base/server/git.nix
    ../base/server/starship.nix
    ../base/desktop/kitty.nix
    ./base.nix
  ];
  
  home = {
    username = username;
    homeDirectory = lib.mkForce "/Users/${username}";

    stateVersion = "23.11";
  };
}