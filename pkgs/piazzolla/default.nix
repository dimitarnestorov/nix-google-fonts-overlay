{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "piazzolla-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a7b3fb1d8ff80d0328baeee896b14cdc6602de2d/ofl/piazzolla/Piazzolla[opsz,wght].ttf?raw=true";
      name = "Piazzolla[opsz,wght].ttf";
      sha256 = "b6b6451daba93a4b71f88ca8e37a66c3fd2b4e57ec54a407cddf6ae65b62c7b7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a7b3fb1d8ff80d0328baeee896b14cdc6602de2d/ofl/piazzolla/Piazzolla-Italic[opsz,wght].ttf?raw=true";
      name = "Piazzolla-Italic[opsz,wght].ttf";
      sha256 = "ffeb38d0c9b332f6ef685352bfbae5e65775ccdc2ae142f49ac8ed2d7d215268";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Piazzolla[opsz,wght].ttf' $out/share/fonts/truetype/'Piazzolla[opsz,wght].ttf'
     install -Dm644 'Piazzolla-Italic[opsz,wght].ttf' $out/share/fonts/truetype/'Piazzolla-Italic[opsz,wght].ttf'
  '';

  meta = with lib; {
    description = "Piazzolla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}