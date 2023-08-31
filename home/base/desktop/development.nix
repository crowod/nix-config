{ pkgs
, pkgs-unstable
, ...
}: {
  #############################################################
  #
  #  Basic settings for development environment
  #
  #  Please avoid to install language specific packages here(globally),
  #  instead, install them independently using dev-templates:
  #     https://github.com/the-nix-way/dev-templates
  #
  #############################################################

  home.file.".ideavimrc".source = ./conf/idea/.ideavimrc;

  home.packages = with pkgs; [
    pkgs-unstable.jetbrains.idea-ultimate

    maven
    pkgs-unstable.nil
    gnumake
    conda

    clang
    rustup
    
    lua
    lua-language-server

    (python311.withPackages (ps:
      with ps; [
        ipython
        requests
      ]))
  ];

  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode.fhs;
  };


  home.file."jdks/openjdk8".source = pkgs.jdk8;
  home.file."jdks/openjdk11".source = pkgs.jdk11;
  home.file."jdks/openjdk17".source = pkgs.jdk17;
}
