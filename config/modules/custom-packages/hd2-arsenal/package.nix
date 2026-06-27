{ appimageTools, requireFile }:
let
  pname = "hd2-arsenal";
  version = "0.36.2";

  src = appimageTools.extract {
    inherit pname version;

    src = requireFile {
      name = "HD2Arsenal-${version}.AppImage";
      url = "https://rsnl.gg/downloads/linux";
      hash = "sha256-xWJiuQr9Tsw5nRTP6QPrd4WlL4An+QqFQy6OvYK28tA=";
    };

    postExtract = ''
      substituteInPlace $out/hd2arsenal.desktop --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    '';
  };
in
appimageTools.wrapAppImage {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm 444 ${src}/hd2arsenal.desktop $out/share/applications/hd2arsenal.desktop
    install -Dm 444 ${src}/hd2arsenal.png $out/usr/share/icons/hicolor/512x512/apps/hd2arsenal.png
  '';
}