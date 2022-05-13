{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tamil-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstamil/NotoSansTamil[wdth,wght].ttf?raw=true";
      name = "NotoSansTamil[wdth,wght].ttf";
      sha256 = "428ee980878dedcdd55d30e26ea493d21b8c5b0da852e5f1dd30b2982da63dfb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansTamil[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansTamil[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}