{ nixpkgs
, home-manager
, system
, specialArgs
, nixos-modules
, home-module
, ...
}:
let
  username = specialArgs.username;
in
nixpkgs.lib.nixosSystem {
  inherit system specialArgs;
  modules =
    nixos-modules
    ++ [
      specialArgs.nur-xddxdd.nixosModules.setupOverlay
      specialArgs.nur-xddxdd.nixosModules.qemu-user-static-binfmt
    ]
    ++ [
      {
        nixpkgs.overlays = [
          specialArgs.nur.overlay
          specialArgs.nil.overlays.default
          (self: super: {
            waybar = super.waybar.overrideAttrs (oldAttrs: {
              mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
            });
          })
        ];
      }
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          users."${username}" = home-module;
        };
      }
    ];
}
