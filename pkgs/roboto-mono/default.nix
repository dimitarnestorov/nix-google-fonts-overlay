{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-mono-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4df0b673c9b316ad5e8de8fa70b0768ab66c87d6/apache/robotomono/RobotoMono%5Bwght%5D.ttf?raw=true";
      name = "RobotoMono_wght_.ttf";
      sha256 = "7d933841c1086c47dad91b2f249b1f8ecabce0d78469242e8bb52ef43cdc925b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4df0b673c9b316ad5e8de8fa70b0768ab66c87d6/apache/robotomono/RobotoMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "RobotoMono-Italic_wght_.ttf";
      sha256 = "59eb64cd4dc45d9c3496988b0a735c1664af2d51ca0c61a9804520fe121d280c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoMono_wght_.ttf $out/share/fonts/truetype/RobotoMono_wght_.ttf
     install -Dm644 RobotoMono-Italic_wght_.ttf $out/share/fonts/truetype/RobotoMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto Mono";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
