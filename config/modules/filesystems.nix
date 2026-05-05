{ config, ... }:
let
  options = {
    default = [
      "defaults"
      "exec"
      "rw"
      "nofail"
    ];

    ntfs = [
      "uid=${toString config.ids.uids.ntfs}"
      "gid=${toString config.ids.gids.ntfs}"
      "umask=000"
    ];
  };
in {
  users.users = {
    ntfs = {
      isSystemUser = true;
      description = "Account used for NTFS mounts.";
    };

    void.extraGroups = [ "ntfs" ];
  };

  fileSystems = {
    "/mnt/Dash10" = {
      device = "/dev/disk/by-uuid/4E62F85B62F8496B";
      fsType = "ntfs";
      options = options.default ++ options.ntfs ++ [];
    };

    "/mnt/ColdBoot" = {
      device = "/dev/disk/by-uuid/98604FD9604FBD2E";
      fsType = "ntfs";
      options = options.default ++ options.ntfs ++ [];
    };

    "/mnt/Ace" = {
      device = "/dev/disk/by-uuid/00C8CB8CC8CB7E82";
      fsType = "ntfs";
      options = options.default ++ options.ntfs ++ [];
    };

    "/mnt/AceOS" = {
      device = "/dev/disk/by-uuid/4E21-0000";
      fsType = "exfat";
      options = options.default ++ [];
    };
  };
}
