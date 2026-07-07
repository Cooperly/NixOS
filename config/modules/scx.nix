{ pkgs-unstable, ... }: {
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    package = pkgs-unstable.scx.full;
    extraArgs = [
      "--performance"
      "--pinned-slice-us 500"
      "--no-core-compaction"
    ];
  };
}