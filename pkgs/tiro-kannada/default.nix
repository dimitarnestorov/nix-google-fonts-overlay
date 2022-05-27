{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-kannada-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fcd9168256b1185e71afcf9ee2166a485b3a443a/ofl/tirokannada/TiroKannada-Regular.ttf?raw=true";
      name = "TiroKannada-Regular.ttf";
      sha256 = "5543779e9eaecf5fcafc2275b37cddd70eddb7352af35da028ab8228b4593050";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fcd9168256b1185e71afcf9ee2166a485b3a443a/ofl/tirokannada/TiroKannada-Italic.ttf?raw=true";
      name = "TiroKannada-Italic.ttf";
      sha256 = "e22b96140842bcdb7c453d68bd18f96aec535182f8b59e5071c8279c6be73c26";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroKannada-Regular.ttf $out/share/fonts/truetype/TiroKannada-Regular.ttf
     install -Dm644 TiroKannada-Italic.ttf $out/share/fonts/truetype/TiroKannada-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Kannada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
