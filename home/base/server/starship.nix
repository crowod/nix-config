{ catppuccin-starship, ... }:
{
  home.file.".config/starship.toml".text = (builtins.readFile ./conf/starship/starship.toml) + (builtins.readFile "${catppuccin-starship}/themes/mocha.toml");

  programs.starship = {
    enable = true;
  };
}
