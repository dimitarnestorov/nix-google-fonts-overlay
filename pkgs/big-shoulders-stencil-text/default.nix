{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-stencil-text-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4ea17f133ba241776798ab68a43bd10b6a15eee4/ofl/bigshouldersstenciltext/BigShouldersStencilText[wght].ttf?raw=true";
      name = "BigShouldersStencilText[wght].ttf";
      sha256 = "583e3423e62bb853b4970d7b10d44384d179d86e3e96a0bc54103cfbfb96a122";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'BigShouldersStencilText[wght].ttf' $out/share/fonts/truetype/'BigShouldersStencilText[wght].ttf'
  '';

  meta = with lib; {
    description = "Big Shoulders Stencil Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}