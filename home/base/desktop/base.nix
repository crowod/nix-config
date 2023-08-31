{ pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    zotero
    maestral
    maestral-gui
    obsidian

    chromium
  ];

  programs = {
    zathura = {
      enable = true;
    };
    mpv = {
      enable = true;
      scripts = [ pkgs.mpvScripts.mpris ];
    };
  };
}
