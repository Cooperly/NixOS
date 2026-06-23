{ pkgs, ... }:
{
  services = {
    wivrn = {
        enable = true;
        package = pkgs.wivrn; 
        autoStart = false;
        highPriority = true;
        openFirewall = true;

        extraServerFlags = [
          "--early-active-runtime"
        ];
      };
    
    monado = {
      enable = true;
      defaultRuntime = true;
    };
  };

  systemd.user.services.monado.environment = {
    XRT_COMPOSITOR_USE_PRESENT_WAIT = "1";
    U_PACING_COMP_TIME_FRACTION_PERCENT = "90";
  };

  environment.systemPackages = with pkgs; [
    wayvr
    xrizer
  ];
}