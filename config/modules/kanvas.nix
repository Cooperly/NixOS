{ ... }: {
  # Kanvas edits hostfiles to redirect mainland roblox to kanvas, this is not done automatically on Nix.
  # You should unload this module if you plan to play mainland roblox!
  environment.etc.hosts.enable = true;

  networking.hosts = {
      "0.0.0.0" = ["www.google-analytics.com"];
      "127.0.0.1" = ["clientsettings.api.kanvas.com" "clientsettings.api.roblox.com" "ephemeralcounters.api.kanvas.com" "ephemeralcounters.api.roblox.com" "versioncompatibility.api.kanvas.com" "versioncompatibility.api.kanvas.com" "versioncompatibility.api.roblox.com" "api.kanvas.com" "api.roblox.com" "analytics.kanvas.com" "analytics.roblox.com" "assetgame.kanvas.com" "assetgame.roblox.com" "data.kanvas.com" "data.roblox.com" "ecsv2.kanvas.com" "ecsv2.roblox.com" "gamepersistence.kanvas.com" "gamepersistence.roblox.com" "public.ecs.kanvas.com" "public.ecs.roblox.com" "wiki.kanvas.com" "wiki.roblox.com" "www.kanvas.com" "www.roblox.com"];
  };
} 