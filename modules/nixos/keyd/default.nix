{ lib, ... }: {
  # key mapping

  environment.etc."keyd/default.conf".source = lib.mkForce ./default.conf;

  services.keyd = {
    enable = true;
  };
}
  