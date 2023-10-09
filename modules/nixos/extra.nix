{ pkgs, pkgs-unstable, lib, ... }:
{
  config = {
    xdg = {
      portal = {
        extraPortals = lib.mkForce (with pkgs; [
          xdg-desktop-portal-wlr
          pkgs-unstable.xdg-desktop-portal-hyprland
        ]);
      };
    };
  };
}