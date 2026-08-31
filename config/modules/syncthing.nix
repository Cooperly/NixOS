{ lib, ... }: {
  services.syncthing = {
    enable = true;
    user = "void";
    dataDir = "/mnt/Ace/";
    relay.enable = true;

    settings = {
      devices = {
        "pjd110" = {
          id = "JTFTKVR-MLNM3FZ-AD7BBYV-AM4LFUE-XBOMZOM-5XYHAGQ-XMZOXTJ-XVOAVAK";
        };
      };
      folders =
        let
          allDevices = [
            "pjd110"
          ];
        in
        {
          Documents = {
            id = "documents";
            path = "/mnt/Ace/Documents";
            devices = allDevices;
          };
          Downloads = {
            id = "downloads";
            path = "/mnt/Ace/Downloads";
            devices = allDevices;
          };
          Videos = {
            id = "videos";
            path = "/mnt/Ace/Videos";
            devices = allDevices;
          };
          Pictures = {
            id = "pictures";
            path = "/mnt/Ace/Pictures";
            devices = allDevices;
          };
          Music = {
            id = "music";
            path = "/mnt/Ace/Music/";
            devices = allDevices;
          };
        };
    };
  };

  # Prevent syncthing from increasing sytem startup times considerably.
  systemd = {
    services = {
      syncthing.wantedBy = lib.mkForce [ ];
      syncthing-init.wantedBy = lib.mkForce [ ];
    };
    timers.syncthing-delayed = {
      wantedBy = [ "multi-user.target" ];
      timerConfig = {
        OnActiveSec = "10s";
        Unit = "syncthing.service";
      };
    };
  };
}
