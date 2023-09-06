self: super:
{
  flameshot = super.flameshot.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "flameshot-org";
      repo = "flameshot";
      rev = "a7e0a618";
      hash = "sha256-BZi/yiw5OQok5+Zh0U9PQa+ckbX/bViFmazkddFUl60=";
    };
    
    nativeBuildInputs = old.nativeBuildInputs ++ [ super.libsForQt5.kguiaddons ];

    cmakeFlags = [
      "-DUSE_WAYLAND_CLIPBOARD=true"
      "-DUSE_WAYLAND_GRIM=true"
    ];
  });
}
