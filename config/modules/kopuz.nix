{ kopuz, system, ... }: {
  environment.systemPackages = [
    kopuz.packages.${system}.default
  ];
}

