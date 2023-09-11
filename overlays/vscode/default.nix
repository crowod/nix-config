self: super: {
  vscode = super.vscode.overrideAttrs (oldAttrs: {
    commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
    preFixup = ''
      gappsWrapperArgs+=(
        # Add gio to PATH so that moving files to the trash works when not using a desktop environment
        --prefix PATH : ${super.glib.bin}/bin
        --add-flags '--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime'
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"
        --add-flags ${super.lib.escapeShellArg super.commandLineArgs}
      )
    '';
  });
}
