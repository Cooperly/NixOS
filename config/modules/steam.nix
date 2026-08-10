{ pkgs, pkgs-unstable, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;

    protontricks = {
      enable = true;
      package = pkgs-unstable.protontricks;
    };

    package = pkgs.steam.override {
      extraEnv = {
        # Support for wivrn.
        PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES = "1";

        PROTON_USE_NTSYNC = "1";
        PROTON_DLSS_UPGRADE= "1";
      };

      extraLibraries = p: with p; [
        atk
      ];
    };

    extraPackages = with pkgs; [
      gamescope
      mangohud
      gamemode
    ];

    extraCompatPackages = with pkgs; [
      proton-ge-bin
      steamtinkerlaunch
    ];
  };

  environment.systemPackages = [
    pkgs.kdePackages.kdialog
    pkgs-unstable.winetricks
  ];

  environment.sessionVariables = {
    WINETRICKS_GUI = "kdialog";
  };
}