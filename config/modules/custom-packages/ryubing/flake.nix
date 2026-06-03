{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    perSystem = { pkgs, ... }: {
      packages.ryubing = pkgs.callPackage ./package.nix { };
    };
  
    systems = [
      "x86_64-linux"
    ];
  };
}