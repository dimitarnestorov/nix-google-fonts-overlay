{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-bengali-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifbengali/NotoSerifBengali%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifBengali_wdth,wght_.ttf";
      sha256 = "2223d59dc64638ccc5a014e1e5af70987065be9fed335c1ad78a5b6d93dc7819";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifBengali_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifBengali_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Bengali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
