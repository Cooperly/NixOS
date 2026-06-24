{ ... }:
{
  swapDevices = [
    {
      device = "/var/swapfile";
      priority = 1;
      size = 32 * 1024;
    }
  ];
}