{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "finlandica-${version}";
  version = "2022-05-13-113603";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3be6b49def6a786e17b914834a9134569676cec2/ofl/finlandica/Finlandica%5Bwght%5D.ttf?raw=true";
      name = "Finlandica_wght_.ttf";
      sha256 = "7cc975c9ada6f93a824a550b8c5b5b81bbd6e801e6f7ae00c874221d76267a42";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3be6b49def6a786e17b914834a9134569676cec2/ofl/finlandica/Finlandica-Italic%5Bwght%5D.ttf?raw=true";
      name = "Finlandica-Italic_wght_.ttf";
      sha256 = "e70ac3a18d169ad8424c5e80b68cd0ebdf5608b562044e3acdd2a101922c6e66";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Finlandica_wght_.ttf $out/share/fonts/truetype/Finlandica_wght_.ttf
     install -Dm644 Finlandica-Italic_wght_.ttf $out/share/fonts/truetype/Finlandica-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Finlandica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
