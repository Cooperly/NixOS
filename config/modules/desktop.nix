{ config, ... }:
{
  programs.niri = {
    enable = true;
    useNautilus = true;

    settings = {
    spawn-at-startup = [
        { command = ["wl-clip-persist" "--clipboard" "both"]; }
        { command = ["sh" "-c" "wl-paste --type text --watch cliphist store"]; }
        { command = ["sh" "-c" "wl-paste --type image --watch cliphist store"]; }
      ];
    };
  };

  systemd.user.services.niri.enableDefaultPath = false;

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${config.programs.niri.package}/bin/niri-session";
          user = "void"; # Replace with your actual username
        };
      };
    };

    # For certain plasma applications to function
    desktopManager.plasma6 = {
      enable = true;
    };
  };

  qt = {
    enable = true;
  };
}
