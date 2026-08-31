{ pkgs, ... }: {
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "#1d1a20"; #  ----
      base01 = "#a893cf"; #  ---
      base02 = "#ac97d2"; #  --
      base03 = "#b09bd5"; #  -
      base04 = "#b49fd8"; #  +
      base05 = "#d8c3f2"; #  ++
      base06 = "#e8d8fb"; #  +++
      base07 = "#eae1f4"; #  ++++
      base08 = "#F38BA8"; #	red
      base09 = "#f3bd8b"; #	orange
      base0A = "#F9E2AF"; #	yellow
      base0B = "#A6E3A1"; #	green
      base0C = "#94E2D5"; #	aqua
      base0D = "#89B4FA"; #	blue
      base0E = "#d8c2f2"; #	purple
      base0F = "#fa895c"; #	brown
    };
    fonts = {
      serif = {
        package = pkgs.rubik;
        name = "Rubik";
      };

      sansSerif = {
        package = pkgs.rubik;
        name = "Rubik";
      };

      monospace = {
        package = pkgs.nerd-fonts._0xproto;
        name = "0xProto Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}