{ ... }:
{

  home.file.".config/wofi".source = ./conf/wofi;

  programs.wofi = {
    enable = true;
  };
}
