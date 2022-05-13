{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vazirmatn-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2aa8060d53136c8dd5fbf02ee63038ea3af69bb6/ofl/vazirmatn/Vazirmatn[wght].ttf?raw=true";
      name = "Vazirmatn[wght].ttf";
      sha256 = "c694cae070256edf1699dc5b0648793fa583060bf49d276e60be03d5fa1c8686";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Vazirmatn[wght].ttf' $out/share/fonts/truetype/'Vazirmatn[wght].ttf'
  '';

  meta = with lib; {
    description = "Vazirmatn";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}