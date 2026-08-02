{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea

    # JVM Runtimes.
    graalvmPackages.graalvm-oracle

    # Build Tools.
    gradle_9
    maven
  ];
}