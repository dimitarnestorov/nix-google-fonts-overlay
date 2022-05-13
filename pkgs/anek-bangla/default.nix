{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-bangla-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/60d08bb25d216d2394094e3ab5e61f92d354bbd8/ofl/anekbangla/AnekBangla[wdth,wght].ttf?raw=true";
      name = "AnekBangla[wdth,wght].ttf";
      sha256 = "8b4ec2eaf7400ea9903718a4addf3135475292e6e0b04db7735d0f999289d919";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AnekBangla[wdth,wght].ttf' $out/share/fonts/truetype/'AnekBangla[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Anek Bangla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}