{ inputs, pkgs, pkgs-unstable, ... }:
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
      pkgs-unstable.xwayland-satellite
      playerctl
      mangohud
      wl-clipboard
      cliphist
      wl-clip-persist
      hyprpolkitagent
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
      hyfetch
      python312Packages.speedtest-cli
      wineWow64Packages.full
      usb-modeswitch
      awww
      gnirehtet
      tmux
      pkgs-unstable.spotiflac
      iotop-c
    ];

    apps = [
      alcom
      alacritty
      bs-manager
      gimp
      pavucontrol
      (prismlauncher.override {
        additionalLibs = [ libxcomposite ];
      })
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
      aseprite
      carla
      blockbench
      goofcord
      pkgs-unstable.osu-lazer-bin 
      (pkgs-unstable.discord.override {
        withVencord = true; 
      })
      heroic
      obsidian
      losslesscut
      protonplus
      r2modman
      blender
      tetrio-desktop
      vinegar
      pkgs-unstable.eden
    ];

    special = [
      inputs.waybar-nixos-updates.packages.${system}.default
      inputs.fluxer.packages.${pkgs.stdenv.hostPlatform.system}.fluxer-canary
      inputs.kopuz.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    custom = [
      # (callPackage ./custom-packages/ryubing/package.nix { })
      (callPackage ./custom-packages/nvibrant/package.nix { })
      # (callPackage ./custom-packages/hd2-arsenal/package.nix { })
    ];

    kde = with kdePackages; [
      kalk
      kclock
      kcolorchooser
      filelight
      gwenview
      krdc
      kjournald
      partitionmanager
      knewstuff
      qt6ct
      qtstyleplugin-kvantum
      kirigami-addons
    ];
  };
in {

  environment.systemPackages = []
    ++ packages.misc
    ++ packages.cli
    ++ packages.apps
    ++ packages.special
    ++ packages.custom
    ++ packages.kde;

  environment.plasma6.excludePackages = [ 
    pkgs.kdePackages.okular
    pkgs.kdePackages.discover
    pkgs.kdePackages.kate
    pkgs.kdePackages.qrca
  ];
}