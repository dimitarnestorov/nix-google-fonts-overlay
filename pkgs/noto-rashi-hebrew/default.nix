{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-rashi-hebrew-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notorashihebrew/NotoRashiHebrew[wght].ttf?raw=true";
      name = "NotoRashiHebrew[wght].ttf";
      sha256 = "3c361fbf8eaf1f409ad84930c44f8e7b3018fd1739ca97583ff2cdd19b85e169";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoRashiHebrew[wght].ttf' $out/share/fonts/truetype/'NotoRashiHebrew[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Rashi Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
