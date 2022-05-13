{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-thambi-2-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/397ea6e1a45c12c2f46fa003276d2c501755d4ab/ofl/baloothambi2/BalooThambi2[wght].ttf?raw=true";
      name = "BalooThambi2[wght].ttf";
      sha256 = "6739a11d3557b7426f0f43ce3a22ff6fbfee2d3be56ffb4df093d35d3460bf73";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'BalooThambi2[wght].ttf' $out/share/fonts/truetype/'BalooThambi2[wght].ttf'
  '';

  meta = with lib; {
    description = "Baloo Thambi 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
