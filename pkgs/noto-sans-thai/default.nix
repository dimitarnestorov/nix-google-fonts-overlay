{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-thai-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthai/NotoSansThai[wdth,wght].ttf?raw=true";
      name = "NotoSansThai[wdth,wght].ttf";
      sha256 = "4dfaca296706635ba28a445d6c79065e5dae0494eefc54436a2b5e40b9a338fb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansThai[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansThai[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Thai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}