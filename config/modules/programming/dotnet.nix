{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.rider
    dotnetCorePackages.sdk_10_0
    dotnetCorePackages.runtime_10_0
  ]; 
}