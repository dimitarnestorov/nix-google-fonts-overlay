{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-1-code-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cc7c9d1136ffad9e89319aa3b8045d985f6ea223/ofl/mplus1code/MPLUS1Code[wght].ttf?raw=true";
      name = "MPLUS1Code[wght].ttf";
      sha256 = "5a8b90c4d0e46c0dfd11eb951303ddc6ab5fba1f77a2ff1184133eed271f9723";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'MPLUS1Code[wght].ttf' $out/share/fonts/truetype/'MPLUS1Code[wght].ttf'
  '';

  meta = with lib; {
    description = "M PLUS 1 Code";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}