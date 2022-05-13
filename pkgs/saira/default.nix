{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3cfea32a77637ada0e209f10d9f91e7ff9d2a32f/ofl/saira/Saira[wdth,wght].ttf?raw=true";
      name = "Saira[wdth,wght].ttf";
      sha256 = "9d050fc5a01c85f74c4257c207d50b55d1e40c37308c642f974a2c5003231dde";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3cfea32a77637ada0e209f10d9f91e7ff9d2a32f/ofl/saira/Saira-Italic[wdth,wght].ttf?raw=true";
      name = "Saira-Italic[wdth,wght].ttf";
      sha256 = "965972c2543b72948aedb55fae36e23175661d0f9d2d8d7f14a1009e466912f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Saira[wdth,wght].ttf' $out/share/fonts/truetype/'Saira[wdth,wght].ttf'
     install -Dm644 'Saira-Italic[wdth,wght].ttf' $out/share/fonts/truetype/'Saira-Italic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Saira";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
