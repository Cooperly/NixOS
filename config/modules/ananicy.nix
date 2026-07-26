{ pkgs, pkgs-unstable, ... }: {
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs-unstable.ananicy-rules-cachyos;
    extraRules = [
      {
        "name" = "fossilize_replay";
        "nice" = 19;
      }
    ];
  };
}