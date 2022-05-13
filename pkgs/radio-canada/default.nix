{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "radio-canada-${version}";
  version = "2022-05-05-090054";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaca09ad5d43f0d3cbc2725d89ddfc977674436/ofl/radiocanada/RadioCanada[wdth,wght].ttf?raw=true";
      name = "RadioCanada[wdth,wght].ttf";
      sha256 = "d44d90a3e8d07b0f95aa9f4a742189810878fac5a2bf28ea4316f631f1e8c572";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbaca09ad5d43f0d3cbc2725d89ddfc977674436/ofl/radiocanada/RadioCanada-Italic[wdth,wght].ttf?raw=true";
      name = "RadioCanada-Italic[wdth,wght].ttf";
      sha256 = "660ff50e73703e49fafa157734832bfa3a30d209bc64a85ee65a4d61b817530e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'RadioCanada[wdth,wght].ttf' $out/share/fonts/truetype/'RadioCanada[wdth,wght].ttf'
     install -Dm644 'RadioCanada-Italic[wdth,wght].ttf' $out/share/fonts/truetype/'RadioCanada-Italic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Radio Canada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}