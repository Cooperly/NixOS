{ pkgs, ... }:
{
  services.wivrn = {
    enable = true;
    package = pkgs.wivrn; 
    autoStart = true;
    highPriority = true;
    openFirewall = true;

    extraServerFlags = [
      "--early-active-runtime"
    ];
  };

  environment.systemPackages = with pkgs; [
    wayvr
    xrizer
  ];
}