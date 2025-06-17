{ pkgs
, pkgs-unstable
, ...
}: {
  home.file.".ideavimrc".source = ./conf/idea/.ideavimrc;

  home.packages = with pkgs; [
    pkgs-unstable.jetbrains.idea-ultimate
    pkgs-unstable.jetbrains.goland
    pkgs-unstable.code-cursor
    pkgs-unstable.devbox
  ];

  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode.fhs;
  };

}
