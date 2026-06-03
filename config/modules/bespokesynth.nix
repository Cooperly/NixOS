{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bespokesynth
  ];

  services.pipewire.extraConfig.pipewire."91-bespokesynth" = {
    "node.rules" = [
      {
        matches = [
          { "node.name" = "alsa_playback..BespokeSynth-wrapped"; }
          { "node.name" = "alsa_capture..BespokeSynth-wrapped"; }
        ];

        actions = {
          update-props = {
            "stream.dont-remix" = true;
          };
        };
      }
    ];
  };
}