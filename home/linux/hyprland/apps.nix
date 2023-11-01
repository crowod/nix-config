{ pkgs-unstable, ... }: {
  programs = {
    # source code: https://github.com/nix-community/home-manager/blob/master/modules/programs/chromium.nix
    google-chrome = {
      enable = true;
      package = (pkgs-unstable.google-chrome.override {
          commandLineArgs = "--gtk-version=4";
      });
    };
  };
}
