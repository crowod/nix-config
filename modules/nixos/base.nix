{ lib
, pkgs
, pkgs-unstable
, ...
}: {


  nixpkgs.config.allowUnfree = lib.mkForce true;

  environment.shells = with pkgs; [
    bash
    fish
  ];


  nix.package = pkgs.nixVersions.latest;
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
              type            "pipewire"
              name            "PipeWire Sound Server"
      }'';
    startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };

  # security with polkit
  services.power-profiles-daemon = {
    enable = true;
  };
  security.polkit.enable = true;
  # security with gnome-kering
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  environment.variables = {
    NIXPKGS_ALLOW_INSECURE = "1";
  };

  environment.systemPackages = with pkgs; [
    pkgs-unstable.neovim
    wget
    curl
    git
    clash-verge-rev
    nixpkgs-fmt
    pkgs-unstable.keyd
    patchelf
    nix-output-monitor
    bc
    miraclecast


    # create a fhs environment by command `fhs`, so we can run non-nixos packages in nixos!
    (
      let
        base = pkgs.appimageTools.defaultFhsEnvArgs;
      in
      pkgs.buildFHSEnv (base
        // {
        name = "fhs";
        targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [ 
          pkgs.pkg-config 
        ];
        profile = "export FHS=1";
        runScript = "bash";
        extraOutputsToInstall = [ "dev" ];
      })
    )
  ];

  virtualisation.docker = {
    enable = true;
    # start dockerd on boot.
    # This is required for containers which are created with the `--restart=always` flag to work.
    enableOnBoot = true;
    daemon.settings = {
      hosts = [
        "unix:///var/run/docker.sock" "tcp://127.0.0.1:2375"
      ];
    };
  };

  environment.variables.EDITOR = "nvim";

  # fonts related
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;

    packages = with pkgs; [
      material-design-icons
      font-awesome

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      noto-fonts-extra

      source-sans
      source-serif
      source-han-sans
      source-han-serif
      
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  environment.shellAliases = {
    su = "su -m";
  };

  services.flatpak.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
