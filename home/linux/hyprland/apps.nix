{ pkgs, ... }: {
  programs = {
    # source code: https://github.com/nix-community/home-manager/blob/master/modules/programs/chromium.nix
    google-chrome = {
      enable = true;
      package = (pkgs.google-chrome.overrideAttrs (oldAttrs: {
          nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.wrapGAppsHook ];
      }));
      commandLineArgs = [
          "--enable-features=TouchpadOverscrollHistoryNavigation,WaylandWindowDecorations"
          "--enable-wayland-ime"
          "--ozone-platform=wayland"
          "--wayland-per-window-scaling"
          "--wayland-text-input-version=3"
      ];
    };
  };
}
