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

    imv
    cliphist

    nur-crowod.packages.${pkgs.system}.pot-translation
  ];

}
