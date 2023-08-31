{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lsof
    strace
    ncdu
  ];
}
