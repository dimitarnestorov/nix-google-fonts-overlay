{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spartan-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3ac54d012eccc2e4c4d87fd2cc7adce528139d8b/ofl/spartan/Spartan[wght].ttf?raw=true";
      name = "Spartan[wght].ttf";
      sha256 = "74658008dc28abd215da0f26a849deb9e6fecc88d36fdf1565f7d2c4fe253516";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Spartan[wght].ttf' $out/share/fonts/truetype/'Spartan[wght].ttf'
  '';

  meta = with lib; {
    description = "Spartan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
