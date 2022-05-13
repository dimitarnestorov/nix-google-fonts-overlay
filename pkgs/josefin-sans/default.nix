{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "josefin-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2a009610af02391398edff605e5c06eb4a67f234/ofl/josefinsans/JosefinSans[wght].ttf?raw=true";
      name = "JosefinSans[wght].ttf";
      sha256 = "9255abdb5f393bc51e101abbd07a716a977fd3e15472b1b84b260f426a342bfd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2a009610af02391398edff605e5c06eb4a67f234/ofl/josefinsans/JosefinSans-Italic[wght].ttf?raw=true";
      name = "JosefinSans-Italic[wght].ttf";
      sha256 = "c22b42ca690be7ea07d04415ac70b48603dff88e854738cba4bd87027b905ef1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'JosefinSans[wght].ttf' $out/share/fonts/truetype/'JosefinSans[wght].ttf'
     install -Dm644 'JosefinSans-Italic[wght].ttf' $out/share/fonts/truetype/'JosefinSans-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Josefin Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
