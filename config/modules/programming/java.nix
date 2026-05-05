{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-oss

    # JVM Runtimes.
    openjdk25

    # Build Tools.
    gradle
    maven

    # Decompilers.
    bytecode-viewer
  ];
}