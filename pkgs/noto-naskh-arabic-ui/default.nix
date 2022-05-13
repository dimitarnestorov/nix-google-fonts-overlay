{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-naskh-arabic-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notonaskharabicui/NotoNaskhArabicUI[wght].ttf?raw=true";
      name = "NotoNaskhArabicUI[wght].ttf";
      sha256 = "cf5baf3d3c174ad66d36ab47a21e0f36f887f13568f9dd8b0c0fad127d9368c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoNaskhArabicUI[wght].ttf' $out/share/fonts/truetype/'NotoNaskhArabicUI[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Naskh Arabic UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}