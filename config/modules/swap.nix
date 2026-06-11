{ ... }:
{
  swapDevices = [
    {
      device = "/var/swapfile";
      priority = 1;
      size = 16 * 1024;
    }
  ];
}