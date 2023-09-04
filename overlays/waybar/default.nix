self: super: {
  waybar = super.waybar.overrideAttrs (previousAttrs: {
    mesonFlags = previousAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  });
}
