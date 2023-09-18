{ pkgs
, nur-crowod
, ...
}: {

  imports = [
    ./gtk.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    qq
    wechat-uos
    telegram-desktop
    
    baidupcs-go
    imv
    cliphist
    osdlyrics
    yesplaymusic

    nur-crowod.packages.${pkgs.system}.pot-translation
    nur-crowod.packages.${pkgs.system}.aliyunpan
  ];

}
