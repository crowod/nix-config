{ kitty-grab, ... }:
{
  programs.kitty = {
    enable = true;

    theme = "Catppuccin-Mocha";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    keybindings = {
      "ctrl+shift+m" = "toggle_maximized";
      "ctrl+shift+z" = "toggle_layout stack";
      "alt+escape" = "launch --stdin-source=@screen_scrollback vim -Rmn";
      "ctrl+alt+]" = "kitten kitty_grab/grab.py";
    };

    settings =
      {
        background_opacity = "0.7";
        scrollback_lines = 10000;
        enable_audio_bell = false;
        tab_bar_edge = "top";
      };
  };

  home.file.".config/kitty/kitty_grab".source = "${kitty-grab}";
  home.file.".config/kitty/grab.conf".source = "${kitty-grab}/grab-vim.conf.example";
}
