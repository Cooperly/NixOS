{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-oss

    # JVM Runtimes.
    graalvmPackages.graalvm-oracle

    # Build Tools.
    gradle_9
    maven
  ];
}