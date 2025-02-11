{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9afc75e55b992c9fe5fbe2589b1b9a39357faddc/ofl/librebarcode39/LibreBarcode39-Regular.ttf?raw=true";
      name = "LibreBarcode39-Regular.ttf";
      sha256 = "0c8907f28765e6f021f3a910d193e4e02f518065fbdcbbc777c1958728bcc6a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39-Regular.ttf $out/share/fonts/truetype/LibreBarcode39-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
