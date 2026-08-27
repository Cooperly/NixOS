{ pkgs-unstable, ... }: {
  services.scx = {
    enable = true;
    scheduler = "scx_cake";
    package = pkgs-unstable.scx.full;
    # extraArgs = [
    #   "--profile esports"
    # ];
  };
}