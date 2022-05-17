{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-odia-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/059d40cac1819d084d21a60e63f2af92631dfa53/ofl/anekodia/AnekOdia%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekOdia_wdth,wght_.ttf";
      sha256 = "673bb6e51b71af1de1f11f9a547a3a58c50a6fa32d480958e1ef0f06980ca45f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekOdia_wdth,wght_.ttf $out/share/fonts/truetype/AnekOdia_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Odia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
