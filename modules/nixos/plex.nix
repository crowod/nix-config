{ username, lib,... }:{
  
  systemd.services.plex.serviceConfig.ProtectHome = lib.mkForce false;

  services.plex = {
    enable = true;
    openFirewall = true;
    user = username;
    group = "users";
  };
}
