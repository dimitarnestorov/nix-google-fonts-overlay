{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-1-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/96800fb3e967b900421481008771f14c3717ec52/ofl/mplus1/MPLUS1[wght].ttf?raw=true";
      name = "MPLUS1[wght].ttf";
      sha256 = "20785932102b0e9809422b2f31cc6b55183d0285c7af63d5373101208267bdc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'MPLUS1[wght].ttf' $out/share/fonts/truetype/'MPLUS1[wght].ttf'
  '';

  meta = with lib; {
    description = "M PLUS 1";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}