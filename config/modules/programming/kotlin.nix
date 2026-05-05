{ pkgs, ... }:
{
  # Most of Kotlin is handled by java.nix, including Kotlin/JVM runtimes and IDEs.

  environment.systemPackages = with pkgs; [
    kotlin
    kotlin-native
    kotlin-language-server
  ];
}