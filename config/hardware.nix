{ config, lib, modulesPath, pkgs, ... }:
let
  options = {
    default = [
      "defaults"
      "exec"
      "rw"
      "nofail"
    ];

    ntfs = [
      "uid=1000"
      "gid=100"
      "umask=000"
    ];
  };
in {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];


    zswap = {
      enable = true;
      compressor = "lz4";
    };

    kernel.sysctl = {
      "kernel.core_pattern" = lib.mkForce " | ${pkgs.coreutils-full}/bin/false";
    };
  };



  fileSystems."/" =
    { device = "/dev/disk/by-uuid/042c237a-2141-4aeb-bc71-3628845b6c02";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/94A7-4B67";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  
  fileSystems."/mnt/Windwave" =
    { device = "/dev/disk/by-uuid/10ACFFAEACFF8D0A";
      fsType = "ntfs";
      options = options.default ++ options.ntfs ++ [];
    };

  fileSystems."/mnt/ColdBoot" =
    { device = "/dev/disk/by-uuid/98604FD9604FBD2E";
      fsType = "ntfs";
      options = options.default ++ options.ntfs ++ [];
    };

  fileSystems."/mnt/AceOS" =
    { device = "/dev/disk/by-uuid/4E21-0000";
      fsType = "exfat";
      options = options.default ++ [];
    };

  fileSystems."/mnt/Ace" =
    { device = "/dev/disk/by-uuid/00C8CB8CC8CB7E82";
      fsType = "ntfs";
      options = options.default ++ options.ntfs ++ [];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
