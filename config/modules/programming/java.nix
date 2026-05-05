{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-oss

    # JVM Runtimes.
    graalvmPackages.graalvm-ce

    # Build Tools.
    gradle
    maven
  ];
}