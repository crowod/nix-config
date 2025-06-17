{ pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs; [

    # archives
    zip
    unzip

    # networking
    mtr

    # terminal processing
    ripgrep
    jq
    tldr
    tree
    fd
    ranger

    # other
    glow
    neofetch
    fswatch
    distrobox

    nushell
    rasdaemon
    ueberzugpp
    pkgs-unstable.yazi
    
];

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "auto";
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
