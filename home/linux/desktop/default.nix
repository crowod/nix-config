{ pkgs
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
  ];

}
