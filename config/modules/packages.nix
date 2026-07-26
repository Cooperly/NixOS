{ inputs, pkgs, pkgs-unstable, helium, ... }:
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
      python312Packages.speedtest-cli
      wineWow64Packages.full
      usb-modeswitch
      awww
      gnirehtet
      tmux
    ];

    apps = [
      alcom
      alacritty
      bs-manager
      gimp
      # obsidian
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
      inputs.kopuz.packages.${pkgs.stdenv.hostPlatform.system}.default
      blockbench
      pkgs-unstable.goofcord
      pkgs-unstable.osu-lazer-bin 
      (pkgs-unstable.discord.override {
        withVencord = true; 
      })
      heroic
      obsidian
      losslesscut
      protonplus
      r2modman
      chromium
      blender
      tetrio-desktop
      vinegar
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
      polkit-kde-agent-1
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
    ++ packages.custom
    ++ packages.kde;

  environment.plasma6.excludePackages = [ 
    pkgs.kdePackages.okular
    pkgs.kdePackages.discover
    pkgs.kdePackages.kate
    pkgs.kdePackages.qrca
  ];
}