{
  description = "NixOS configuration of crowod";

  outputs =
    inputs @ { self
    , nixpkgs
    , nixpkgs-unstable
    , home-manager
    , nix-darwin
    , nixpkgs-darwin
    , ...
    }:
    let
      username = "crowod";
      email = "xiangcz929@gmail.com";
      x64_system = "x86_64-linux";
      aarch64_darwin = "aarch64-darwin";

      nixosSystem = import ./lib/nixosSystem.nix;
      macosSystem = import ./lib/macosSystem.nix;

      nia_modules = {
        nixos-modules = [
          ./hosts/nia
          ./modules/nixos/hyprland.nix
          ./modules/nixos/extra.nix
        ];
        home-module = import ./home/linux/desktop.nix;
        module_name = "nia";
      };
      mio_modules = {
        nixos-modules = [
          ./hosts/mio
          ./modules/nixos/hyprland.nix
          ./modules/nixos/extra.nix
        ];
        home-module = import ./home/linux/desktop.nix;
        module_name = "mio";
      };
      
      hikari_modules = {
        darwin-modules = [
          ./hosts/hikari
        ];
        home-module = import ./home/darwin;
      };
      
      x64_specialArgs =
        {
          inherit username email x64_system;
        } // inputs // {
          nur-xddxdd = import inputs.nur-xddxdd {
            modules = [
              # Add packages from this repo
              inputs.nur-xddxdd.nixosModules.setupOverlay
            ];
            pkgs = import nixpkgs {
              localSystem = {
                system = x64_system;
              };
              config = {
                permittedInsecurePackages = [ 
                  "electron-19.1.9"
                  "openssh-with-hpn-9.2p1"
                  "openssl-1.1.1v"
                  "openssl-1.1.1w"
                  "python-2.7.18.6"
                ];
                allowUnfree = true;
              };
            };
          };
        };
      aarch64_darwin_specialArgs =
        {
          inherit username email;
          system = aarch64_darwin;
          pkgs-unstable = import nixpkgs-unstable {
            system = aarch64_darwin;
            config.allowUnfree = true;
          };
        } // inputs;
    in
    {
      nixosConfigurations =
        let
          base_args = {
            inherit home-manager;
            nixpkgs = nixpkgs; # or nixpkgs-unstable
            system = x64_system;
            specialArgs = x64_specialArgs;
          };
        in
        {
          nia = nixosSystem (nia_modules // base_args);
          mio = nixosSystem (mio_modules // base_args);
        };
        darwinConfigurations = let
          base_args = {
            system = aarch64_darwin;
            inherit nix-darwin home-manager nixpkgs nixpkgs-darwin;
            specialArgs = aarch64_darwin_specialArgs;
          };
        in {
          hikari = macosSystem (hikari_modules // base_args);
        };
    };


  inputs = {
    # There are many ways to reference flake inputs. The most widely used is github:owner/name/reference,
    # which represents the GitHub repository URL + branch/commit-id/tag.

    # Official NixOS package source, using nixos's stable branch by default
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    nur.url = "github:nix-community/NUR";
    
    # Run unpatched binaries on Nix/NixOS
    nix-alien.url = "github:thiagokokada/nix-alien";


    # The Nix User Repository (NUR) is community-driven meta repository for Nix packages. 
    nur-xddxdd = {
      url = "github:xddxdd/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur-crowod = {
      url = "github:crowod/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # for macos
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    # home-manager, used for managing user configuration
    home-manager = {
      # url = "github:nix-community/home-manager/master";
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # modern window compositor
    hyprland.url = "github:hyprwm/Hyprland/v0.28.0";
    # community wayland nixpkgs
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    # a wayland launcher
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # age-encrypted secrets for NixOS
    agenix.url = "github:ryantm/agenix/0d8c5325fc81daf00532e3e26c6752f7bcde1143";

    # Nix language server
    nil.url = "github:oxalica/nil";

    # kitty grab
    kitty-grab = {
      url = "github:yurikhan/kitty_grab";
      flake = false;
    };
    
    # wallpapers
    wallpapers = {
      url = "github:crowod/wallpapers";
      flake = false;
    };

    # color schema
    catppuccin-fcitx5 = {
      url = "github:catppuccin/fcitx5";
      flake = false;
    };
    catppuccin-kitty = {
      url = "github:catppuccin/kitty";
      flake = false;
    };
    catppuccin-hyprland = {
      url = "github:catppuccin/hyprland";
      flake = false;
    };
    catppuccin-btop = {
      url = "github:catppuccin/btop";
      flake = false;
    };
    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
    catppuccin-fish = {
      url = "github:catppuccin/fish";
      flake = false;
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    hammerspoon-config = {
      url = "https://github.com/crowod/hammerspoon.git";
      flake = false;
      type = "git";
      submodules = true;
    };
  };


  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];

    substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
      "https://attic.xuyh0120.win/lantian"
      "https://crowod.cachix.org"
      "https://anyrun.cachix.org"
    ];

    # nix community's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"

    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "crowod.cachix.org-1:JXeKWrnjh01P7veGCKotIcdU3cjmZocly3ZQPJTQH98="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };


}
