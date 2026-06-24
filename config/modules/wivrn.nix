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
        
        monadoEnvironment = {
          XRT_COMPOSITOR_USE_PRESENT_WAIT = "1";
          U_PACING_COMP_TIME_FRACTION_PERCENT = "90";

          GBM_BACKEND = "nvidia-drm";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          LIBVA_DRIVER_NAME = "nvidia";

          __GL_VRR_ALLOWED = "0";
          __GL_GYSYNC_ALLOWED = "0";
        };
      };
  };

  environment.systemPackages = with pkgs; [
    wayvr
    xrizer
  ];
}