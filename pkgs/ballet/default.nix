{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ballet-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/03fc129d8f320c5cbfbaed842c7325efb9ca9c59/ofl/ballet/Ballet%5Bopsz%5D.ttf?raw=true";
      name = "Ballet_opsz_.ttf";
      sha256 = "6500b6abb6dd31c3389e8f32a21ae3c66e3257d0afefecf7688aa23f742cb677";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ballet_opsz_.ttf $out/share/fonts/truetype/Ballet_opsz_.ttf
  '';

  meta = with lib; {
    description = "Ballet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
