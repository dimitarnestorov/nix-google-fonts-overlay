{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nats-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/nats/NATS-Regular.ttf?raw=true";
      name = "NATS-Regular.ttf";
      sha256 = "0e660a99459c55c9031f9c55b8b5038debadaec56bab4849d838f7e411f2fcbb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NATS-Regular.ttf $out/share/fonts/truetype/NATS-Regular.ttf
  '';

  meta = with lib; {
    description = "NATS";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
