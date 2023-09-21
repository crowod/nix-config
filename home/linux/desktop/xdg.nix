{ config
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications =
        let
          browser = [ "google-chrome.desktop" ];
        in
        {
          "application/json" = browser;
          "application/pdf" = [ "org.pwmt.zathura.desktop" ]; # TODO: pdf viewer

          "text/html" = browser;
          "text/xml" = browser;
          "application/xml" = browser;
          "application/xhtml+xml" = browser;
          "application/xhtml_xml" = browser;
          "application/rdf+xml" = browser;
          "application/rss+xml" = browser;
          "application/x-extension-htm" = browser;
          "application/x-extension-html" = browser;
          "application/x-extension-shtml" = browser;
          "application/x-extension-xht" = browser;
          "application/x-extension-xhtml" = browser;

          "x-scheme-handler/about" = browser;
          "x-scheme-handler/ftp" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "x-scheme-handler/lxmusic" = [ "lx-music-desktop.desktop" ];

          "x-scheme-handler/tg" = [ "telegramdesktop.desktop" ];

          "image/*" = [ "imv.desktop" ];
          "image/gif" = [ "imv.desktop" ];
          "image/jpeg" = [ "imv.desktop" ];
          "image/png" = [ "imv.desktop" ];
          "image/webp" = [ "imv.desktop" ];
        };

    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
