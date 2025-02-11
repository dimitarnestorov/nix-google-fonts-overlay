{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-canadian-aboriginal-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscanadianaboriginal/NotoSansCanadianAboriginal%5Bwght%5D.ttf?raw=true";
      name = "NotoSansCanadianAboriginal_wght_.ttf";
      sha256 = "66e2c47457bad34d00d702ee3a051ff020cd697c4a4e2896c1d3473de333ca9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCanadianAboriginal_wght_.ttf $out/share/fonts/truetype/NotoSansCanadianAboriginal_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Canadian Aboriginal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
