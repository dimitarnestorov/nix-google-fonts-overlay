{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hurricane-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/05e8975af5e22228cff9e6715af08587fd89bb8b/ofl/hurricane/Hurricane-Regular.ttf?raw=true";
      name = "Hurricane-Regular.ttf";
      sha256 = "5ea86b562ca5c2b1893c233367cde1aee0d677bb6d30af9c3f699c270880da13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hurricane-Regular.ttf $out/share/fonts/truetype/Hurricane-Regular.ttf
  '';

  meta = with lib; {
    description = "Hurricane";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
