{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-oss

    # JVM Runtimes.
    graalvmPackages.graalvm-ce
    openjdk25

    # Build Tools.
    gradle_9
    maven
  ];
}