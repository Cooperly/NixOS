{ ... }: {
  networking = {
    hostName = "wave";

    networkmanager = {
      enable = true;
      wifi = {
        backend = "wpa_supplicant";
        powersave = false;
      };
      dns = "none";
    };

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];

    firewall = {
      # Steam ports specified manually, as otherwise my system will lose networking when Steam opens.
      allowedTCPPorts = [
        27015 # Steam SRCDS Rcon port
        27036 # Steam Client Discovery (Local Transfers)
        27037 # Steam Remote Play
        27040 # Steam Local Transfers
      ];
      allowedUDPPorts = [
        10400 # Steam Remote Play
        10401 # Steam Remote Play
        27015 # Steam Game Server
        27031 # Steam Remote Play
        27032 # Steam Remote Play
        27033 # Steam Remote Play
        27034 # Steam Remote Play
        27035 # Steam Remote Play
        27036 # Steam Remote Play
      ];
    };
  };
  
  # Required for the TX20U Plus to work
  hardware.usb-modeswitch.enable = true;
}
