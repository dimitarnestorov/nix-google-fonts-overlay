{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "meow-script-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc12dc56576abd13e8d20d218b242bddd86ef973/ofl/meowscript/MeowScript-Regular.ttf?raw=true";
      name = "MeowScript-Regular.ttf";
      sha256 = "20e58b8455a19f18c687d67e2edfa0b62bd7b66d18ae68f5f47e0b603c197776";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MeowScript-Regular.ttf $out/share/fonts/truetype/MeowScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Meow Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
