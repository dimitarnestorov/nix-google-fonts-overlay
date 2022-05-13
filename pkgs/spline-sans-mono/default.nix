{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spline-sans-mono-${version}";
  version = "2022-04-21-093433";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/754c4a21e0e5360bd28c26f514535c1c4c1a620e/ofl/splinesansmono/SplineSansMono[wght].ttf?raw=true";
      name = "SplineSansMono[wght].ttf";
      sha256 = "f0a19cb6407b00c30b9079044e383134ea686253055078853e64d6b0a39bd01d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'SplineSansMono[wght].ttf' $out/share/fonts/truetype/'SplineSansMono[wght].ttf'
  '';

  meta = with lib; {
    description = "Spline Sans Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
