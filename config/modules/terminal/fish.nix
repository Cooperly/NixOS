{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = builtins.readFile ./config.fish;
  };

  users.defaultUserShell = pkgs.fish;

  environment.shellAliases = {
    # pkill uses similar syntax and kills by process name, not executable name
    # (thus no need for adding nix wrapper shit).
    killall = "pkill";
  };

  environment.systemPackages = with pkgs; [
    nix-your-shell
  ];
}