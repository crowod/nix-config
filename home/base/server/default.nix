{ ... }:
{
  imports = [
    ./neovim
    ./base.nix
    ./tmux.nix
    ./bash.nix
    ./fish.nix
    ./starship.nix
    ./git.nix
    ./bat.nix
    ./nix-alien.nix
    ./development.nix
  ];
}
