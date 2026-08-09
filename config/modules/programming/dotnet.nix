{ pkgs, config, ... }:
let 
  nixpkgs = pkgs.fetchFromGitHub {
    owner="NixOS";
    repo="nixpkgs";
    rev="4e8f054c353c19ebc4b2780db635d932de24a58b";
    hash="sha256-bAN0yvOMp1BwW1EeGjAamkVcFw2oohQIOz5uSmoDxU8=";
  };
  oldpkgs = import nixpkgs {
    system = pkgs.stdenv.hostPlatform.system;
    config = config.nixpkgs.config;
  };
  in
{
  environment.systemPackages = with pkgs; [
    oldpkgs.jetbrains.rider
    dotnetCorePackages.sdk_10_0
    dotnetCorePackages.runtime_10_0
  ]; 
}