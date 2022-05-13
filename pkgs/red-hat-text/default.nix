{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-hat-text-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f029c6bb20fb274dbcec681b7c2af53a936d0f7b/ofl/redhattext/RedHatText[wght].ttf?raw=true";
      name = "RedHatText[wght].ttf";
      sha256 = "b59fa79ec1d75320e229eb965f5cd04a299af3b654e097f03adcb6f4e46aeeb1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f029c6bb20fb274dbcec681b7c2af53a936d0f7b/ofl/redhattext/RedHatText-Italic[wght].ttf?raw=true";
      name = "RedHatText-Italic[wght].ttf";
      sha256 = "7a173452bf59874e67fa9498691fa429f67dc29eb4b99933d1e40b7359d25402";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'RedHatText[wght].ttf' $out/share/fonts/truetype/'RedHatText[wght].ttf'
     install -Dm644 'RedHatText-Italic[wght].ttf' $out/share/fonts/truetype/'RedHatText-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Red Hat Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
