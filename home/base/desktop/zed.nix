{ ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "catppuccin"
      "catppuccin-icons"
      "gdscript"
      "html"
    ];

    userSettings = builtins.fromJSON (builtins.readFile ./conf/zed/settings.json);
    userKeymaps = builtins.fromJSON (builtins.readFile ./conf/zed/keymap.json);
  };
}
