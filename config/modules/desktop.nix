{ config, ... }:
{
  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  systemd.user.services.niri.enableDefaultPath = false;

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${config.programs.niri.package}/bin/niri-session";
          user = "void";
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
