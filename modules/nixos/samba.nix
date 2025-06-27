{ ... }:
{


networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
networking.firewall.allowedTCPPorts = [ 445 139 ];
networking.firewall.allowedUDPPorts = [ 137 138 ];
  

services.samba-wsdd = {
  # make shares visible for Windows clients
  enable = true;
};
services.samba = {
  enable = true;
  securityType = "user";
  settings = {
    global = {
      "workgroup" = "WORKGROUP";
      "server string" = "smbnix";
      "netbios name" = "smbnix";
      "security" = "user";
      #"use sendfile" = "yes";
      #"max protocol" = "smb2";
      # note: localhost is the ipv6 localhost ::1
      "hosts allow" = "192.168.2. 127.0.0.1 localhost";
      # "hosts deny" = "0.0.0.0/0";
      "guest account" = "nobody";
      "map to guest" = "bad user";
    };
    "movies" = {
      path = "/home/crowod/Downloads/movies";
      public = "yes";
      browseable = "yes";
      writable = "yes";
      available = "yes";
      "valid users" = "crowod";
      "read only" = "no";
      "guest ok" = "yes";
      "create mask" = "0755";
      "directory mask" = "0755";
      "force user" = "crowod";
    };
    "bangumi" = {
      path = "/home/crowod/Downloads/ani-rss";
      public = "yes";
      browseable = "yes";
      writable = "yes";
      available = "yes";
      "valid users" = "crowod";
      "read only" = "no";
      "guest ok" = "yes";
      "create mask" = "0755";
      "directory mask" = "0755";
      "force user" = "crowod";
    };
  };
};

}