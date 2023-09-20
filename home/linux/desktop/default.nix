{ pkgs
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

    nur-xddxdd.packages.${pkgs.system}.baidupcs-go

    nur-crowod.packages.${pkgs.system}.pot-translation
    nur-crowod.packages.${pkgs.system}.aliyunpan
  ];

}
