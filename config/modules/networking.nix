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
  nameservers = [ "1.1.1.1" "1.0.0.1" "2606:4700:4700::1111" "2606:4700:4700::1001" ];
  };
  # Required for the TX20U Plus to work
  hardware.usb-modeswitch.enable = true;
}
