{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "snippet-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/snippet/Snippet.ttf?raw=true";
      name = "Snippet.ttf";
      sha256 = "66acef67275368057085d747e688e5dcd48807d98fb6a3ca9a9424734bda1353";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Snippet.ttf $out/share/fonts/truetype/Snippet.ttf
  '';

  meta = with lib; {
    description = "Snippet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
