{ ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "both";
    extraUpFlags = [
      "--operator=void"
    ];
  };
}