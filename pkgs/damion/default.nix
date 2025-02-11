{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "damion-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/damion/Damion-Regular.ttf?raw=true";
      name = "Damion-Regular.ttf";
      sha256 = "9de51427297db717072b0d3adb07b7f90b8fa4d31a0463ad1ea674fa60e67666";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Damion-Regular.ttf $out/share/fonts/truetype/Damion-Regular.ttf
  '';

  meta = with lib; {
    description = "Damion";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
