{ pkgs
, catppuccin-fcitx5
, nur-crowod
, ...
}: {

  home.file.".local/share/fcitx5/themes".source = "${catppuccin-fcitx5}/src";
  home.file.".config/fcitx5/conf/classicui.conf".source = ./classicui.conf;


  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-configtool
      fcitx5-chinese-addons
      fcitx5-gtk
      nur-crowod.packages.${pkgs.system}.fcitx5-pinyin-moegirl
      nur-crowod.packages.${pkgs.system}.fcitx5-pinyin-zhwiki
    ];
  };
}
