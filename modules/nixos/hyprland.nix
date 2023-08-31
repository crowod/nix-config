{ pkgs, ... }:
{
  programs = {
    hyprland = {
      enable = true;

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

    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "hyprland";
        lightdm.enable = false;
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      layout = "cn";
      xkbVariant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    waybar # the status bar
    swayidle # the idle timeout
    swaylock-effects # lock screen
    wlogout # logout menu
    wl-clipboard # copying and pasting
    hyprpicker # color picker
    
    swww # the wallpaper

    wf-recorder # creen recording
    grim # taking screenshots
    slurp # select reigon for grim 

    swappy # screenshot

    mako # the notification daemon, the same as dunst

    alsa-utils # the advanced linux sound architecture
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet
  ];

  security.pam.services.swaylock = { };
}
