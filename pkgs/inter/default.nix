{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inter-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f1a5408575a7bdf850161445c882b16b5afb84c6/ofl/inter/Inter[slnt,wght].ttf?raw=true";
      name = "Inter[slnt,wght].ttf";
      sha256 = "bfff5663c84b220f3c6dbb0e5225c66eab3d79e0d67351bbac151b5109c78a2d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Inter[slnt,wght].ttf' $out/share/fonts/truetype/'Inter[slnt,wght].ttf'
  '';

  meta = with lib; {
    description = "Inter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
