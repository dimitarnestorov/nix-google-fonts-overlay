{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tourney-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eb0bc5baaca1d95e5352f706f042064fffbe72ac/ofl/tourney/Tourney[wdth,wght].ttf?raw=true";
      name = "Tourney[wdth,wght].ttf";
      sha256 = "ee686a1a657ca9397d4d1e9ba3ada1c10a5d9b6da53aeb94411cd62b1b793377";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eb0bc5baaca1d95e5352f706f042064fffbe72ac/ofl/tourney/Tourney-Italic[wdth,wght].ttf?raw=true";
      name = "Tourney-Italic[wdth,wght].ttf";
      sha256 = "038c789a1ec5be0e935b8a7ad7de6cec7bd0ed8e54cd82f2c95478f54b0744ce";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Tourney[wdth,wght].ttf' $out/share/fonts/truetype/'Tourney[wdth,wght].ttf'
     install -Dm644 'Tourney-Italic[wdth,wght].ttf' $out/share/fonts/truetype/'Tourney-Italic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Tourney";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}