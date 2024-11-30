{ pkgs, ... }:
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
];

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = true;
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
