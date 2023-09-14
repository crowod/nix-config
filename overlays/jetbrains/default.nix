{ ... }@args:
self: super:
{
  jetbrains = super.jetbrains // {
    jdk = super.jetbrains.jdk.overrideAttrs (oldAttrs: {
      patches = oldAttrs.patches ++ [
        ./idea.patch
      ];
    });
    idea-ultimate = if args.module_name == "mio" then super.symlinkJoin {
        name = "idea-ultimate";
        buildInputs = with super; [ makeWrapper ];
        paths = with super;[
          jetbrains.idea-ultimate
        ];

        postBuild = ''
          wrapProgram $out/bin/idea-ultimate \
            --prefix GDK_SCALE : 1 \
            --prefix GDK_DPI_SCALE : 1.5 \
        '';
      } else super.jetbrains.idea-ultimate;
    };
}
