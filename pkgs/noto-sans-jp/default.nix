{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-jp-${version}";
  version = "2022-05-12-102739";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7426c2b974eac5b9f473bfa107ed1fdc4f8d3e15/ofl/notosansjp/NotoSansJP[wght].ttf?raw=true";
      name = "NotoSansJP[wght].ttf";
      sha256 = "7a6c3aa178ae44a627a31a3cdd21eaa257fde7018f669b99fc5bb82118f0895a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansJP[wght].ttf' $out/share/fonts/truetype/'NotoSansJP[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans JP";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}