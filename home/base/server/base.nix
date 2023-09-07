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

    nushell
  ];

  programs = {
    exa = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
