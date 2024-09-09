{ pkgs-unstable, ... }:
{
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
    package = pkgs-unstable.neovim-unwrapped;
  };

  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua".source = ./lua;
}
