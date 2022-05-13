{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-telugu-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstelugu/NotoSansTelugu[wdth,wght].ttf?raw=true";
      name = "NotoSansTelugu[wdth,wght].ttf";
      sha256 = "4ccb16188c0129aa3f3d15058639c3f1cd39b7bedd10d734a3e609f4f30ed75b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansTelugu[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansTelugu[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
