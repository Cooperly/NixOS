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
        edk2-uefi-shell.enable = true;
        windows = {
          "11-dash" = {
            title = "Dash10";
            efiDeviceHandle = "FS1";
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

