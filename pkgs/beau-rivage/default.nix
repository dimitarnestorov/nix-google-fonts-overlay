{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "beau-rivage-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d3115f1ef99d09a91f6890cd25353f7c1cb1231/ofl/beaurivage/BeauRivage-Regular.ttf?raw=true";
      name = "BeauRivage-Regular.ttf";
      sha256 = "6a407ad2418a5e29ceb447de49fb11e614615de4943292e3862347fa010e7bba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BeauRivage-Regular.ttf $out/share/fonts/truetype/BeauRivage-Regular.ttf
  '';

  meta = with lib; {
    description = "Beau Rivage";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
