{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "truculenta-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1a2e47430947b139461aee1ed0331866c745f255/ofl/truculenta/Truculenta[opsz,wdth,wght].ttf?raw=true";
      name = "Truculenta_opsz,wdth,wght_.ttf";
      sha256 = "08d8abe8590e3fef246801f86ef1ede30f8c7a000500857024a590529c443f3c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Truculenta_opsz,wdth,wght_.ttf $out/share/fonts/truetype/Truculenta_opsz,wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Truculenta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
