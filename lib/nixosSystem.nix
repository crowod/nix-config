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
      overlays = (import ../overlays {module_name = module_name;});
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
