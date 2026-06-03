{ pkgs, lib, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_zen.override {
      structuredExtraConfig = with lib.kernel; {
        EXPERT = yes;
        PREEMPT_RT = yes;
        PREEMPT_VOLUNTARY = lib.mkForce no;
        RT_GROUP_SCHED = no;
        NTSYNC = yes;
      };
    });

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        # edk2-uefi-shell.enable = true;
        # netbootxyz.enable = true;
        # memtest86.enable = true;
        configurationLimit = 5;
        windows = {
          # For some reason, USB storage devices take the first available device handles.
          # This causes the device handle with WBM to constantly shift around depending on what is connected.
          # There are multiple boot entries to compensate for this. This looks bad, but I don't think I can do anything about this.

          # This represents either only an HDD being connected or the the TX20U Plus acting like a storage device
          "11-dash" = {
            title = "Dash10";
            efiDeviceHandle = "FS1";
            sortKey = "z_windows";
          };

          # TWO represents an HDD being connected and the TX20U Plus acting like a storage device simultaneously
          "11-dash-TWO" = {
            title = "Dash10-TWO";
            efiDeviceHandle = "FS2";
            sortKey = "z_windows";
          };

          # NONE represents no USB storage devices being connected.
          "11-dash-NONE" = {
            title = "Dash10-NONE";
            efiDeviceHandle = "FS0";
            sortKey = "z_windows";
          };
        };
      };
    };

    kernel.sysctl = {
      "kernel.sysrq" = 1;
      "vm.max_map_count" = 2147483642;
      "vm.swappiness" = 10;
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
}

