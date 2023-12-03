{ pkgs, pkgs-unstable, ... }: {
  programs = {
    # source code: https://github.com/nix-community/home-manager/blob/master/modules/programs/chromium.nix
    google-chrome = {
      enable = true;
      package = (pkgs.google-chrome.overrideAttrs (oldAttrs: {
          nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.wrapGAppsHook ];
          commandLineArgs = "--gtk-version=4";
      }));
    };
  };
}
