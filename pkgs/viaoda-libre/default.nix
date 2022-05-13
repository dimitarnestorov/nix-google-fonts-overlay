{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "viaoda-libre-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/75e3993fb4a3739592c2ea3e365cc94d5d33e469/ofl/viaodalibre/ViaodaLibre-Regular.ttf?raw=true";
      name = "ViaodaLibre-Regular.ttf";
      sha256 = "adb53ede25107c5ed4c45f993fd014a21ef82ac82b2327a564fe8e994e228942";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ViaodaLibre-Regular.ttf $out/share/fonts/truetype/ViaodaLibre-Regular.ttf
  '';

  meta = with lib; {
    description = "Viaoda Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}