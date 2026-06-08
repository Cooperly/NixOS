{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    dolphin-overlay.url = "github:FUFSoB/dolphin-overlay"; # Change to https://github.com/rumboon/dolphin-overlay later

    kopuz = { 
      url = "github:temidaradev/kopuz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nix-flatpak,
      stylix,
      dolphin-overlay,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      nixpkgs-options = {
        inherit system;

        config = {
          allowUnfree = true;
          cudaSupport = true;
        };
      };

      pkgs = import nixpkgs nixpkgs-options;
    in rec {
      nixosConfigurations.wave = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;

          pkgs-unstable = import nixpkgs-unstable nixpkgs-options;
        };

        modules = [
          {
            nixpkgs.config = nixpkgs-options.config;
            nixpkgs.overlays = [ dolphin-overlay.overlays.default ];
          }

          nix-flatpak.nixosModules.nix-flatpak
          stylix.nixosModules.stylix
          inputs.nixvim.nixosModules.nixvim

          ./config/main.nix
        ];
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          nh
          nixd
          nixfmt
        ];
      };
    };
}
