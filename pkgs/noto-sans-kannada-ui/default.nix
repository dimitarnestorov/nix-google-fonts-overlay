{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kannada-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskannadaui/NotoSansKannadaUI[wdth,wght].ttf?raw=true";
      name = "NotoSansKannadaUI[wdth,wght].ttf";
      sha256 = "a0b35c3ff628b3da3df104a1d5c83408ed50ce33168976704a298936a2900329";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansKannadaUI[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansKannadaUI[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Kannada UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}