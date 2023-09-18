{ catppuccin-btop, ... }: {

  home.file.".config/btop/themes".source = "${catppuccin-btop}/themes";

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
      theme_background = "transparent";
      vim_keys = true;
      proc_sorting = "memory";
    };
  };
}
