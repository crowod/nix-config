{ pkgs, catppuccin-fish, ... }:
{

  home.file.".config/fish/themes".source = "${catppuccin-fish}/themes";


  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fish_config theme choose Catppuccin\ Mocha
      fish_vi_key_bindings
      set fish_greeting # Disable greeting
      bind \t accept-autosuggestion
      fzf --fish | source
    '';

    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "85f863f20f24faf675827fb00f3a4e15c7838d76";
          sha256 = "sha256-+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];

    shellAliases = {
      rg = "rg -L";
    };
  };
}
