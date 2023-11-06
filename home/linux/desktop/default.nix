{ pkgs
, pkgs-unstable
, nur-crowod
, nur-xddxdd
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
    yesplaymusic
    motrix
    qbittorrent
    wine
    pkgs-unstable.feishu
    pkgs-unstable.komikku
    
    nur-no-pkgs.repos.linyinfeng.wemeet
    pkgs-unstable.wpsoffice-cn

    nur-xddxdd.wechat-uos
    nur-xddxdd.baidupcs-go

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
