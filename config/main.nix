{ ... }:
{
  imports = [
    ./hardware.nix

    ./modules/boot.nix
    ./modules/flatpak.nix
  
    ./modules/ananicy.nix
    ./modules/stylix.nix
    ./modules/scx.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/nvidia.nix
    ./modules/nh.nix
    ./modules/packages.nix
    ./modules/steam.nix
    ./modules/sudo.nix
    ./modules/tailscale.nix
    ./modules/networking.nix
    ./modules/internationalization.nix

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

      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
        "https://cache.nixos-cuda.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="      
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  

  nixpkgs.config.permittedInsecurePackages = ["librewolf-bin-150.0-1" "librewolf-bin-unwrapped-150.0-1"];

  system.stateVersion = "25.11";
}
