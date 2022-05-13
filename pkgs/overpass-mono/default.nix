{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "overpass-mono-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/55c4c396ff0d12beaa40883ab3fe9b7400b67a12/ofl/overpassmono/OverpassMono[wght].ttf?raw=true";
      name = "OverpassMono[wght].ttf";
      sha256 = "49f230e10251608f0ae1a2ce46be768d7b9ddcbe5cdca2e9f6b762fcbce1ae4f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'OverpassMono[wght].ttf' $out/share/fonts/truetype/'OverpassMono[wght].ttf'
  '';

  meta = with lib; {
    description = "Overpass Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
