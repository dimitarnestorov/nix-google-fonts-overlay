{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vujahday-script-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6bed0406a7056e5e7337ecad31528a50328d038/ofl/vujahdayscript/VujahdayScript-Regular.ttf?raw=true";
      name = "VujahdayScript-Regular.ttf";
      sha256 = "f102428da88931f20c5ed947d9f8aea85ee3f1d4a18b51a74b4f59a344ce5daa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VujahdayScript-Regular.ttf $out/share/fonts/truetype/VujahdayScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Vujahday Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
