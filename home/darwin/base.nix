{ pkgs, pkgs-unstable, hammerspoon-config, ... }:
{

  home.file.".ideavimrc".source = ../base/desktop/conf/idea/.ideavimrc;
  home.file.".hammerspoon".source = "${hammerspoon-config}";

  home.file.".config/karabiner/assets/complex_modifications/map_capslock.json".source = ./karabiner/map_capslock.json;

  home.packages = with pkgs; [
    pkgs-unstable.nil
  ];

  programs = {
    eza = {
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