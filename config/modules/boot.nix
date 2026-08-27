{ pkgs, lib, ... }:
{
  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto-x86_64-v3;

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        # edk2-uefi-shell.enable = true;
        # netbootxyz.enable = true;
        # memtest86.enable = true;
        configurationLimit = 3;
      };
    };

    kernel.sysctl = {
      "kernel.sysrq" = 1;
      "vm.max_map_count" = 2147483642;
      "vm.swappiness" = 1;
      "net.ipv4.ip_unprivileged_port_start" = 0;
    };

    kernelParams = [
      "net.ifnames=0"
      "usbcore.autosuspend=-1"
      "rtw89_pci.disable_aspm_l1=y"
      "rtw89_pci.disable_aspm_l1ss=y"
      "rtw89_core.disable_ps_mode=y"
      "transparent_hugepage=always"
      "transparent_hugepage_shmem=always"
    ];

    # AppImage support.
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
  };

  # Watchdog to prevent realtime processes from hanging the system.
  services.das_watchdog.enable = true;

  system.nixos.label = "Wave";
}

