{ ... }: {
  programs.bash = {
    enable = true;

    bashrcExtra = ''
      set -o vi;
    '';
  };
}
