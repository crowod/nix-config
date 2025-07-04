{ pkgs
, pkgs-unstable
, nur-crowod
, nur-no-pkgs
, ...
}: {

  imports = [
    ./gtk.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    qq
    telegram-desktop
    
    imv
    cliphist
    osdlyrics
    motrix
    wine
    pkgs-unstable.qbittorrent
    pkgs-unstable.feishu
    pkgs-unstable.komikku
    pkgs-unstable.wechat
    
    pkgs.wemeet

    nur-crowod.packages.${pkgs.system}.pot-translation

    nur-crowod.packages.${pkgs.system}.aliyunpan
    nur-crowod.packages.${pkgs.system}.lx-music-desktop
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs-unstable.obs-studio-plugins; [
      wlrobs
      obs-shaderfilter
    ];
    package = pkgs-unstable.obs-studio;
  };

}
