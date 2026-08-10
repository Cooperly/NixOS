{ lib, ... }:
{
  imports = [
    ./hardware.nix

    ./modules/boot.nix
    ./modules/flatpak.nix

    ./modules/hardware/nvidia.nix

    ./modules/swap.nix

    ./modules/ananicy.nix
    ./modules/nix-ld.nix
    ./modules/bespokesynth.nix
    ./modules/dolphin.nix
    ./modules/fonts.nix
    ./modules/stylix.nix
    ./modules/scx.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/nh.nix
    ./modules/packages.nix
    ./modules/steam.nix
    ./modules/sudo.nix
    ./modules/tailscale.nix
    ./modules/networking.nix
    ./modules/neovim.nix
    ./modules/wivrn.nix
    ./modules/obs.nix
    ./modules/xdg.nix
    ./modules/internationalization.nix
    ./modules/ssh.nix
    ./modules/git.nix

    ./modules/programming/dotnet.nix
    ./modules/programming/java.nix
    ./modules/programming/kotlin.nix
    ./modules/programming/rust.nix

    ./modules/audio/pipewire.nix
    ./modules/audio/plugins.nix
    ./modules/audio/realtime.nix

    ./modules/terminal/fish.nix
  ];
  
  nix = {
    settings = {
      auto-optimise-store = true;
      download-buffer-size = 70000000;
      download-speed = 200 * 1024; # 200 Mbps
      cores = 4;

      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
        "https://kopuz.cachix.org"
        "https://attic.xuyh0120.win/lantian"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw="
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      ];
    };
  };

  nixpkgs.config.permittedInsecurePackages = [];

    nixpkgs.config.allowInsecurePredicate = it: builtins.elem (lib.getName it) [
    "olm"
    "openssl" # Unity
    "librewolf-bin"
    "librewolf-bin-unwrapped"

    # 26.05 - bitwarden-desktop
    "electron"
  ];

  system.stateVersion = "25.11";
}
