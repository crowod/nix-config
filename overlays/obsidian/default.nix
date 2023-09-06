
self: super: {
  obsidian = super.symlinkJoin {
      name = "obsidian";
      buildInputs = with super; [ makeWrapper ];
      paths = with super;[
        obsidian
      ];
      postBuild = "wrapProgram $out/bin/obsidian --add-flags '--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime'";
    };
}
