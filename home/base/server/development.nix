{ pkgs
, pkgs-unstable
, ...
}: {

  home.packages = with pkgs; [
    maven
    pkgs-unstable.nil
    gnumake
    cmake
    conda

    clang
    rustup

    lua
    lua-language-server
    
    ruby

    go

    (python311.withPackages (ps:
      with ps; [
        ipython
        requests
      ]))
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };


  home.file."jdks/openjdk8".source = pkgs.jdk8;
  home.file."jdks/openjdk11".source = pkgs.jdk11;
  home.file."jdks/openjdk17".source = pkgs.jdk17;
}
