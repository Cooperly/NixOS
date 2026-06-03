{ pkgs, ... }:
let
  fonts = {
    sans = {
      packages = with pkgs; [
        rubik
        noto-fonts
        noto-fonts-cjk-sans
      ];

      names = [
        "Rubik"
        "Noto Sans"
        "Noto Sans CJK TC"
        "Noto Sans CJK HK"
        "Noto Sans CJK KR"
        "Noto Sans CJK SC"
      ];
    };

    serif = {
      packages = with pkgs; [
        rubik
        noto-fonts
        noto-fonts-cjk-serif
      ];

      names = [
        "Rubik"
        "Noto Serif"
        "Noto Serif CJK TC"
        "Noto Serif CJK HK"
        "Noto Serif CJK KR"
        "Noto Serif CJK SC"
      ];
    };

    monospace = {
      packages = with pkgs; [
        nerd-fonts._0xproto
      ];

      names = [
        "0xProto Nerd Font Mono"
      ];
    };

    emoji = {
      packages = with pkgs; [
        noto-fonts-color-emoji
      ];

      names = [
        "Noto Color Emoji"
      ];
    };
  };
in {
  fonts = {
    packages = [ ]
      ++ fonts.sans.packages
      ++ fonts.serif.packages
      ++ fonts.monospace.packages
      ++ fonts.emoji.packages;

    fontconfig = {
      enable = true;
      cache32Bit = true;
      antialias = true;

      allowBitmaps = true;
      useEmbeddedBitmaps = true;

      defaultFonts = {
        serif = fonts.serif.names;
        sansSerif = fonts.sans.names;
        monospace = fonts.monospace.names;
        emoji = fonts.emoji.names;
      };

      hinting = {
        enable = true;
        style = "slight";
      };
    };
  };
}