{ ... }: {
  programs = {
    # source code: https://github.com/nix-community/home-manager/blob/master/modules/programs/chromium.nix
    google-chrome = {
      enable = true;
      commandLineArgs = [
          "--gtk-version=4"
          "--enable-wayland-ime"
          "--ozone-platform-hint=auto"
          "--ozone-platform=wayland"
          "--wayland-per-window-scaling"
          "--wayland-text-input-version=3"
      ];
    };
    firefox = {
      enable = true;
    };
  };
}
