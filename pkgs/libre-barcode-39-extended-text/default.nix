{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-extended-text-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d6d517e00c75d4d888b3c31078bd75c5ef65a4fb/ofl/librebarcode39extendedtext/LibreBarcode39ExtendedText-Regular.ttf?raw=true";
      name = "LibreBarcode39ExtendedText-Regular.ttf";
      sha256 = "d7b50101f16c4dc3eae0bd1bab254c1fda6b69a1396db72b1767be229a0cec2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39ExtendedText-Regular.ttf $out/share/fonts/truetype/LibreBarcode39ExtendedText-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39 Extended Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
