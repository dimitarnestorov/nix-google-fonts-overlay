{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fraunces-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ac502d8eff76ef4d9477cdcc8ef7d0c84fde5372/ofl/fraunces/Fraunces[SOFT,WONK,opsz,wght].ttf?raw=true";
      name = "Fraunces[SOFT,WONK,opsz,wght].ttf";
      sha256 = "177ff6c0f14e5550a3c624247cd1189611d4eb65d000b14944c63d967958abbb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ac502d8eff76ef4d9477cdcc8ef7d0c84fde5372/ofl/fraunces/Fraunces-Italic[SOFT,WONK,opsz,wght].ttf?raw=true";
      name = "Fraunces-Italic[SOFT,WONK,opsz,wght].ttf";
      sha256 = "b24448c43702fac4ee856781d461a0dfba8d8e594b6e8e190234b75fed2c0e01";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Fraunces[SOFT,WONK,opsz,wght].ttf' $out/share/fonts/truetype/'Fraunces[SOFT,WONK,opsz,wght].ttf'
     install -Dm644 'Fraunces-Italic[SOFT,WONK,opsz,wght].ttf' $out/share/fonts/truetype/'Fraunces-Italic[SOFT,WONK,opsz,wght].ttf'
  '';

  meta = with lib; {
    description = "Fraunces";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}