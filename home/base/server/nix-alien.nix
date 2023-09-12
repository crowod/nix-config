{ self, pkgs, ... }: {
  
  home.packages = with self.inputs.nix-alien.packages.${pkgs.system}; [
    nix-alien
  ];
}