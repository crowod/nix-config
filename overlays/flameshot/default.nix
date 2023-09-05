self: super:
{
  flameshot = super.flameshot.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "flameshot-org";
      repo = "flameshot";
      rev = "a7e0a618";
      hash = "sha256-BZi/yiw5OQok5+Zh0U9PQa+ckbX/bViFmazkddFUl60=";
    };
    cmakeFlags = [
      "-DUSE_WAYLAND_GRIM=true"
    ];
  });
}
