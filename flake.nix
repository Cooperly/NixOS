{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nix-flatpak,
      stylix,
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
          }

          nix-flatpak.nixosModules.nix-flatpak
          stylix.nixosModules.stylix

          ./config/main.nix
        ];
      };

      apps.${system}."wave:vm" = {
        type = "app";
        program = "${nixosConfigurations.wave.config.system.build.vm}/bin/run-nixos-vm";
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
