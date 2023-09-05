self: super:
{
  jetbrains = super.jetbrains // {
    jdk = super.jetbrains.jdk.overrideAttrs (oldAttrs: {
      patches = oldAttrs.patches ++ [
        ./idea.patch
      ];
    });
  };
}
