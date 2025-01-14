{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-hat-display-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/95950e9bae04859cfa193b845d550f5d037243a2/ofl/redhatdisplay/RedHatDisplay%5Bwght%5D.ttf?raw=true";
      name = "RedHatDisplay_wght_.ttf";
      sha256 = "aedd467b28cb9e8433a7678f783fa714e317f2f0d0d5593bf6d8c3e0a8d59359";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/95950e9bae04859cfa193b845d550f5d037243a2/ofl/redhatdisplay/RedHatDisplay-Italic%5Bwght%5D.ttf?raw=true";
      name = "RedHatDisplay-Italic_wght_.ttf";
      sha256 = "631d0e1bcb24b4dc5df604b19ebf24367d27a209e019abc7810e62b194e953f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedHatDisplay_wght_.ttf $out/share/fonts/truetype/RedHatDisplay_wght_.ttf
     install -Dm644 RedHatDisplay-Italic_wght_.ttf $out/share/fonts/truetype/RedHatDisplay-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Red Hat Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
