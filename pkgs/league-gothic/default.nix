{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "league-gothic-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e64fb81de77247813e64a6fc75e27cc5934698a/ofl/leaguegothic/LeagueGothic[wdth].ttf?raw=true";
      name = "LeagueGothic[wdth].ttf";
      sha256 = "3b0e998c9a0034222394ffecdd383e6948259ad037b95555b139a217629ce1d0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'LeagueGothic[wdth].ttf' $out/share/fonts/truetype/'LeagueGothic[wdth].ttf'
  '';

  meta = with lib; {
    description = "League Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}