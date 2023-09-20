self: super:
{
  osdlyrics = super.osdlyrics.overrideAttrs (old: {
    patches = [
      ./lyrics.patch  
    ];
  });
}