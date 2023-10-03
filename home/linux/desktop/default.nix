{ pkgs
, pkgs-unstable
, nur-crowod
, nur-xddxdd
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

    pkgs-unstable.wpsoffice-cn

    # nur-xddxdd.packages.${pkgs.system}.baidupcs-go
    # nur-xddxdd.packages.${pkgs.system}.wechat-uos
    nur-xddxdd.wechat-uos
    nur-xddxdd.baidupcs-go

    nur-crowod.packages.${pkgs.system}.pot-translation
    nur-crowod.packages.${pkgs.system}.aliyunpan
    nur-crowod.packages.${pkgs.system}.lx-music-desktop
  ];

}
