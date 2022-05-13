{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sofia-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae2673e9576cef514b32a81811d0891e57d45ad2/ofl/sofiasans/SofiaSans[wdth,wght].ttf?raw=true";
      name = "SofiaSans[wdth,wght].ttf";
      sha256 = "3b7e7a151692a86efbcdd1766b83e85cce76773a0c8ac494b7d6933ff71d6821";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae2673e9576cef514b32a81811d0891e57d45ad2/ofl/sofiasans/SofiaSans-Italic[wdth,wght].ttf?raw=true";
      name = "SofiaSans-Italic[wdth,wght].ttf";
      sha256 = "1fc51eee4df3526b62d3039ca049e95e799f15a69ccb7c07cd9eaec89623f97f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'SofiaSans[wdth,wght].ttf' $out/share/fonts/truetype/'SofiaSans[wdth,wght].ttf'
     install -Dm644 'SofiaSans-Italic[wdth,wght].ttf' $out/share/fonts/truetype/'SofiaSans-Italic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Sofia Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}