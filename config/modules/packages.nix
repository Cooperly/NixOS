{ pkgs, pkgs-unstable, ... }:
let
  patch-nixpkgs = patches:
    import (pkgs.applyPatches {
      src = pkgs.path;
      patches = patches;
    }) {
      inherit (pkgs.stdenv.hostPlatform) system;
    };

  ##############################################################################
  # Package List

  packages = with pkgs; {
    misc = [
      bibata-cursors
      xwayland-satellite
      pkgs-unstable.nvibrant
      rubik
    ];

    cli = [
      android-tools
      bitwarden-cli
      btop
      devenv
      dig
      ffmpeg
      file
      gdb
      httpie
      jq
      libva-utils
      lm_sensors
      lsof
      micro
      net-tools
      nvtopPackages.nvidia
      openssl
      p7zip
      pciutils
      rclone
      tree
      waypipe
      whois
      yt-dlp
      fastfetch
      git
    ];

    apps = [
      alcom
      alacritty
      bitwarden-desktop
      bs-manager
      equibop
      gimp
      libreoffice-qt6
      obsidian
      obs-studio
      pavucontrol
      prismlauncher
      qmmp
      qpwgraph
      teamspeak6-client
      telegram-desktop
      unityhub
      vlc
      vrcx
      vscode
      librewolf-bin
      waybar
      mako
      rofi
      libsForQt5.qt5ct
    ];

    kde = with kdePackages; [
      kalk
      kclock
      kcolorchooser
      kate
      filelight
      gwenview
      krdc
      kjournald
      partitionmanager
      polkit-kde-agent-1
      knewstuff
      qt6ct
      qtstyleplugin-kvantum
    ];
  };
in {
  environment.systemPackages = []
    ++ packages.misc
    ++ packages.cli
    ++ packages.apps
    ++ packages.kde;
}