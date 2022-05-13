{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bengali-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbengali/NotoSansBengali[wdth,wght].ttf?raw=true";
      name = "NotoSansBengali[wdth,wght].ttf";
      sha256 = "42fca296182e97f2e9cae6e0f95b1eeef16066cf7d48db172c1ad56bf1125554";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansBengali[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansBengali[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Bengali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}