{ nixpkgs
, home-manager
, system
, specialArgs
, nixos-modules
, home-module
, module_name
, ...
}:
let
  username = specialArgs.username;
  args = specialArgs // { 
    module_name = module_name; 
    pkgs-unstable = import specialArgs.nixpkgs-unstable {
      system = specialArgs.x64_system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
        "zotero-6.0.27"
        "electron-25.9.0"
      ];
      overlays = (import ../overlays {module_name = module_name;});
    };
    nur-no-pkgs = import specialArgs.nur {
      nurpkgs = import nixpkgs { system = system; };
      pkgs = import nixpkgs {
          config = {
            allowUnfree = true;
          };
          localSystem = {
            system = system;
          };
      };
    };

  };
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = args;
  modules =
    nixos-modules
    ++ [
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = args;
          users."${username}" = home-module;
        };
        nixpkgs.overlays = [
          args.nur.overlay
          args.nil.overlays.default
        ] ++ (import ../overlays {module_name = module_name;});
      }
    ];
}
