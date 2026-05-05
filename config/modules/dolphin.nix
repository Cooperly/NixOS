{ pkgs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      kdePackages = prev.kdePackages.overrideScope (finalKdePackages: prevKdePackages: {
        dolphin = prevKdePackages.dolphin.overrideAttrs (old: {
          nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ prev.makeWrapper ];
          postInstall = (old.postInstall or "") + ''
            wrapProgram "$out/bin/dolphin" \
                --set XDG_CONFIG_DIRS "${prevKdePackages.kservice}/etc/xdg:$XDG_CONFIG_DIRS" \
                --run "${prevKdePackages.kservice}/bin/kbuildsycoca6 --noincremental ${prevKdePackages.kservice}/etc/xdg/menus/applications.menu"
          '';
        });
      });
    })
  ];
  
  environment.systemPackages = with pkgs.kdePackages; [      
    frameworkintegration # provides Qt plugin
    kauth # provides helper service
    kcoreaddons # provides extra mime type info
    kded # provides helper service
    kfilemetadata # provides Qt plugins
    kguiaddons # provides geo URL handlers
    kiconthemes # provides Qt plugins
    kimageformats # provides Qt plugins
    qtimageformats # provides optional image formats such as .webp and .avif
    kio # provides helper service + a bunch of other stuff
    kio-admin # managing files as admin
    kio-extras # stuff for MTP, AFC, etc
    kio-fuse # fuse interface for KIO
    knighttime # night mode switching daemon
    kpackage # provides kpackagetool tool
    kservice # provides kbuildsycoca6 tool
    kunifiedpush # provides a background service and a KCM
    kwallet # provides helper service
    kwallet-pam # provides helper service
    kwalletmanager # provides KCMs and stuff
    plasma-activities # provides plasma-activities-cli tool
    solid # provides solid-hardware6 tool
    phonon-vlc # provides Phonon plugin
    baloo # system indexer
    breeze
    breeze-icons
    breeze-gtk
    dolphin
    dolphin-plugins
    ffmpegthumbs
    kconfig # required for xdg-terminal from xdg-utils
    qtbase # for qtpaths which is required for xdg-mime from xdg-utils
  ];
}
