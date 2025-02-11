{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "syne-mono-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/27d61f9f7001a1c61572ce06edf8e5443e55f184/ofl/synemono/SyneMono-Regular.ttf?raw=true";
      name = "SyneMono-Regular.ttf";
      sha256 = "b142b088680791725849cc74c54d7937c981de2378583bde72f826bd3eb267dc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SyneMono-Regular.ttf $out/share/fonts/truetype/SyneMono-Regular.ttf
  '';

  meta = with lib; {
    description = "Syne Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
