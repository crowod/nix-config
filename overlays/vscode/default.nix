self: super: {
  vscode = super.vscode.override {
    commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
  };
}
