{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mohave-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/22be014c6adeafa37abbeddc303d7fb7295ae6db/ofl/mohave/Mohave%5Bwght%5D.ttf?raw=true";
      name = "Mohave_wght_.ttf";
      sha256 = "860d62875f0f3df923b30a3c2fe8123237ef4b5daaaf08a80594d6fe667fc0e3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/22be014c6adeafa37abbeddc303d7fb7295ae6db/ofl/mohave/Mohave-Italic%5Bwght%5D.ttf?raw=true";
      name = "Mohave-Italic_wght_.ttf";
      sha256 = "eb6dd96b5b0c1f88b145f6c2d041d9a48aedc1de6dc84f1c9cd0f82fc61231a9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mohave_wght_.ttf $out/share/fonts/truetype/Mohave_wght_.ttf
     install -Dm644 Mohave-Italic_wght_.ttf $out/share/fonts/truetype/Mohave-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Mohave";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
