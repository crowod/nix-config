{ pkgs
, pkgs-unstable
, ...
}: {
  home.file.".ideavimrc".source = ./conf/idea/.ideavimrc;

  home.packages = with pkgs; [
    pkgs-unstable.jetbrains.idea-ultimate
  ];

  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode.myfhs;
  };
}
