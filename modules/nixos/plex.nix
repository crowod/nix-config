{ ... }:{

  services.plex = {
    enable = true;
    openFirewall = true;
    user="crowod";
    dataDir = "/home/crowod/plex";
  };
}
