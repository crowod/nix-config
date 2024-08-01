{ catppuccin-bat, ... }: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Catppuccin-mocha";
    };
    themes = {
      Catppuccin-mocha = builtins.readFile "${catppuccin-bat}/themes/Catppuccin Mocha.tmTheme";
    };
  };
}
