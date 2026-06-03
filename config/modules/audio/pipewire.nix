{ ... }:
{
  services.pipewire = {
    enable = true;
    socketActivation = true;

    # Emulate support for other sound servers.
    pulse.enable = true;
    jack.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
    
    
    extraConfig.pipewire = {
      "99-custom" = {
        "context.properties" = {
          default.clock = {
            rate = 48000;
            quantum = 1024;
            min-quantum = 32;
            max-quantum = 2048;
          };
        };
      };
      "91-virtual-audio" = {
        "context.objects" = [
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "output";
              "node.description" = "Output";
              "media.class" = "Audio/Sink";
              "audio.channels" = 2;
              "audio.position" = "FL,FR";
            };
          }
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "comms";
              "node.description" = "Comms";
              "media.class" = "Audio/Sink";
              "audio.channels" = 2;
              "audio.position" = "FL,FR";
            };
          }
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "music";
              "node.description" = "Music";
              "media.class" = "Audio/Sink";
              "audio.channels" = 2;
              "audio.position" = "FL,FR";
            };
          }
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "input";
              "node.description" = "Input";
              "media.class" = "Audio/Source/Virtual";
              "audio.channels" = 1;
              "audio.position" = "FL";
            };
          }
        ];
      };
    };
  };
}