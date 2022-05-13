{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "public-sans-${version}";
  version = "2022-05-13-114616";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37caf657942042c2de8f5f11d9d6866a1b689b84/ofl/publicsans/PublicSans[wght].ttf?raw=true";
      name = "PublicSans[wght].ttf";
      sha256 = "d75a7dc1a27eb9e336d5b33f55489d2ecb5621bf694d5c43b2415bce2ca830a8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37caf657942042c2de8f5f11d9d6866a1b689b84/ofl/publicsans/PublicSans-Italic[wght].ttf?raw=true";
      name = "PublicSans-Italic[wght].ttf";
      sha256 = "6ce292b05aa8c66bc644bedff834b4d0ddee9af75c55f98dcb28faa32a81056f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'PublicSans[wght].ttf' $out/share/fonts/truetype/'PublicSans[wght].ttf'
     install -Dm644 'PublicSans-Italic[wght].ttf' $out/share/fonts/truetype/'PublicSans-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Public Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
