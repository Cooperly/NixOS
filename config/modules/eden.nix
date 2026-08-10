{ inputs, ... }: {
  imports = [ inputs.eden.nixosModules.default ];

  programs.eden.enable = true;
}