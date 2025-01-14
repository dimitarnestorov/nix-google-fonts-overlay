{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unlock-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/unlock/Unlock-Regular.ttf?raw=true";
      name = "Unlock-Regular.ttf";
      sha256 = "408560b387d49cc5bdde72936531a6da3abd74abee117efcc77615822acba537";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Unlock-Regular.ttf $out/share/fonts/truetype/Unlock-Regular.ttf
  '';

  meta = with lib; {
    description = "Unlock";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
