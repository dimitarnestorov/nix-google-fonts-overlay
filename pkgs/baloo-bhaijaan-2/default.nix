{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhaijaan-2-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a6eb370bf3728a1f47e483a0d5a31788fd5aabf4/ofl/baloobhaijaan2/BalooBhaijaan2%5Bwght%5D.ttf?raw=true";
      name = "BalooBhaijaan2_wght_.ttf";
      sha256 = "e5c2144df39fae55c342431c177cc50a00542de93b94d1365af6288d440deaf8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooBhaijaan2_wght_.ttf $out/share/fonts/truetype/BalooBhaijaan2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Bhaijaan 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
