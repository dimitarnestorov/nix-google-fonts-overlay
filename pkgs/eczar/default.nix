{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "eczar-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/597475e6f4459f731c6857f7c64ecc5183e4e10d/ofl/eczar/Eczar%5Bwght%5D.ttf?raw=true";
      name = "Eczar_wght_.ttf";
      sha256 = "b52af3a3b457f9b2278612b73c97eaf28270ffc91c99e4c90471cc15bb8748c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Eczar_wght_.ttf $out/share/fonts/truetype/Eczar_wght_.ttf
  '';

  meta = with lib; {
    description = "Eczar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
