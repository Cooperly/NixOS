{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    rnnoise-plugin
    lsp-plugins
  ];

  environment.variables =
    let
      makePluginPath = format: lib.makeSearchPath format [
        "$HOME/.nix-profile/lib"
        "/run/current-system/sw/lib"
        "/etc/profiles/per-user/$USER/lib"
      ];
    in {
      CLAP_PATH = makePluginPath "clap";
      DSSI_PATH = makePluginPath "dssi";
      LADSPA_PATH = makePluginPath "ladspa";
      LV2_PATH = makePluginPath "lv2";
      LXVST_PATH = makePluginPath "lxvst";
      VST3_PATH = makePluginPath "vst3";
      VST_PATH = makePluginPath "vst";
    };
}