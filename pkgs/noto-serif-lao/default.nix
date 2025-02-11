{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-lao-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoseriflao/NotoSerifLao%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifLao_wdth,wght_.ttf";
      sha256 = "f002daca32a976bf714b66e4ba5d3e3ab4fa0c178c371f66adcd8f8e1200f80c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifLao_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifLao_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Lao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
