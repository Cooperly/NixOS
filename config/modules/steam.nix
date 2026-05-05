{ pkgs, pkgs-unstable, ... }:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    protontricks = {
      enable = true;
      package = pkgs-unstable.protontricks;
    };

    package = pkgs.steam.override {
      extraEnv = {};

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