{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6 = {
    enable = true;
  };

  qt = {
    enable = true;
  };
}