{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jost-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/91b26e2e0231f5aa85f5470a7b23d6d732ab15fc/ofl/jost/Jost%5Bwght%5D.ttf?raw=true";
      name = "Jost_wght_.ttf";
      sha256 = "6343b70971000b04c5d401c96ae08ce371086135e999d5e1e1413039c0213076";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/91b26e2e0231f5aa85f5470a7b23d6d732ab15fc/ofl/jost/Jost-Italic%5Bwght%5D.ttf?raw=true";
      name = "Jost-Italic_wght_.ttf";
      sha256 = "15a6f7e3e11f9e8e338a583a6fe03e8f6b1d9ce877efa3fe579282b6c1cb15fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jost_wght_.ttf $out/share/fonts/truetype/Jost_wght_.ttf
     install -Dm644 Jost-Italic_wght_.ttf $out/share/fonts/truetype/Jost-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Jost";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
