{ ... }:
{
  swapDevices = [
    {
      device = "/var/swapfile";
      priority = 1;
      size = 16 * 1024;
    }
  ];

  zramSwap = {
    enable = true;
    priority = 2;
    algorithm = "zstd";
    memoryPercent = 25;
  };
}