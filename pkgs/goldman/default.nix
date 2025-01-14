{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "goldman-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37e0f8a4fd9c64a680682ec1f3e006aaba974abd/ofl/goldman/Goldman-Regular.ttf?raw=true";
      name = "Goldman-Regular.ttf";
      sha256 = "747d4eb547ffca1b1c4ceb49d38f04a2cd8767d5d86425b71290456ab8eb280a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37e0f8a4fd9c64a680682ec1f3e006aaba974abd/ofl/goldman/Goldman-Bold.ttf?raw=true";
      name = "Goldman-Bold.ttf";
      sha256 = "3d875bc02d79dff86369ada5b4c4d8c1b7b184bc70a322b651aa5c39693631e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Goldman-Regular.ttf $out/share/fonts/truetype/Goldman-Regular.ttf
     install -Dm644 Goldman-Bold.ttf $out/share/fonts/truetype/Goldman-Bold.ttf
  '';

  meta = with lib; {
    description = "Goldman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
