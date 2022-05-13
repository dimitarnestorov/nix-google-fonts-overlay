{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "newsreader-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/991ce1de6075188e6b8977a5aa9fcd3610a4e946/ofl/newsreader/Newsreader[opsz,wght].ttf?raw=true";
      name = "Newsreader[opsz,wght].ttf";
      sha256 = "8a08d13f8a6c0d51be379a60af84f945f65369a67e509ee3c3bdcc421254d7c1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/991ce1de6075188e6b8977a5aa9fcd3610a4e946/ofl/newsreader/Newsreader-Italic[opsz,wght].ttf?raw=true";
      name = "Newsreader-Italic[opsz,wght].ttf";
      sha256 = "796668611f80b64d5adf182fde3b6f29ed83b4e7cbec7b96937e84ac01364792";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Newsreader[opsz,wght].ttf' $out/share/fonts/truetype/'Newsreader[opsz,wght].ttf'
     install -Dm644 'Newsreader-Italic[opsz,wght].ttf' $out/share/fonts/truetype/'Newsreader-Italic[opsz,wght].ttf'
  '';

  meta = with lib; {
    description = "Newsreader";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}