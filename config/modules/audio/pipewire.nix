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
            quantum = 256;
            min-quantum = 64;
            max-quantum = 512;
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
              "node.name" = "Media";
              "node.description" = "Media";
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
              "node.description" = "Music (Personal)";
              "media.class" = "Audio/Sink";
              "audio.channels" = 2;
              "audio.position" = "FL,FR";
            };
          }
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "music2";
              "node.description" = "Music (Stream)";
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