{ 
  catppuccin-hyprland
, wallpapers
, ...
}:
{

  imports = [
    ./anyrun.nix
    ./apps.nix
    ./wofi.nix
    ./conf.nix
  ];

  # hyprland config
  home.file.".config/hypr/themes".source = "${catppuccin-hyprland}/themes";
  
  # mako config
  home.file.".config/mako/config".source = ./conf/mako/config;

  # waybar config
  home.file.".config/waybar/".source = ./conf/waybar;

  # wlogout config
  home.file.".config/wlogout/".source = ./conf/wlogout;

  # mpd
  home.file.".config/mpd".source = ./conf/mpd;

  # scripts
  home.file.".config/scripts".source = ./conf/scripts;

  # swappy
  home.file.".config/swappy/config".source = ./conf/swappy/config;
  
  home.file."wallpapers".source = "${wallpapers}";

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_EGL_NO_MODIFIRES = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland,x11";
  };
}

