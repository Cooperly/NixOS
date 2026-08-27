{ pkgs, ... }: {
  programs = {
    obs-studio = {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        obs-retro-effects
        obs-move-transition
        waveform
        obs-tuna
        obs-vkcapture
        input-overlay
        obs-replay-source
        obs-scale-to-sound
        obs-composite-blur
        # obs-vertical-canvas
        obs-aitum-multistream
        pixel-art
        obs-plugin-countdown
        obs-3d-effect
        obs-source-clone
      ];
    };
  };
}
