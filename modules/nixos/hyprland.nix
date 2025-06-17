{ pkgs, pkgs-unstable, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      package = pkgs.hyprland;


      xwayland = {
        enable = true;
      };
    };
    light.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    clash-verge = {
      enable = true;
      autoStart = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    displayManager = {
        defaultSession = "hyprland";
	sddm = {
	  enable = true;
	  wayland = {
	    enable = true;
	  };
	};
	enable = true;
    };

    xserver = {
      enable = true;

      xkb.layout = "cn";
    };
  };

  environment.systemPackages = with pkgs; [
    pkgs-unstable.waybar # the status bar
    swayidle # the idle timeout
    swaylock-effects # lock screen
    wlogout # logout menu
    wl-clipboard # copying and pasting
    hyprpicker # color picker

    pkgs-unstable.swww # the wallpaper

    wf-recorder # creen recording
    grim # taking screenshots
    slurp # select reigon for grim 

    flameshot # screen shot

    mako # the notification daemon, the same as dunst

    alsa-utils # the advanced linux sound architecture
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet

    wireplumber
  ];

  security.pam.services.swaylock = { };

}
