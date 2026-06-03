{ ... }:
let
  defaults = {
    "code.desktop" = [
      "text/plain"
      "text/x-csrc"
      "text/toml"
    ];
    "qmmp.desktop" = [
      "audio/aac"
      "audio/mp4"
      "audio/mpeg"
      "audio/mpegurl"
      "audio/ogg"
      "audio/vorbis"
      "audio/x-flac"
      "audio/x-mp3"
      "audio/x-mpegurl"
      "audio/x-ms-wma"
      "audio/x-musepack"
      "audio/x-oggflac"
      "audio/x-scpls"
      "audio/x-vorbis"
      "audio/x-vorbis+ogg"
    ];
    "org.kde.gwenview.desktop" = [
      "image/avif"
      "image/bmp"
      "image/heif"
      "image/jpeg"
      "image/png"
      "image/webp"
      "image/x-icns"
    ];
    "vlc.desktop" = [
      "video/mp4"
    ];
    "org.kde.ark.desktop" = [
      "application/gzip"
      "application/vnd.ms-cab-compressed"
      "application/vnd.rar"
      "application/x-7z-compressed"
      "application/x-archive"
      "application/x-bcpio"
      "application/x-bzip"
      "application/x-bzip-compressed-tar"
      "application/x-cd-image"
      "application/x-compress"
      "application/x-compressed-tar"
      "application/x-cpio"
      "application/x-cpio-compressed"
      "application/x-iso9660-appimage"
      "application/x-lha"
      "application/x-lrzip-compressed-tar"
      "application/x-lz4-compressed-tar"
      "application/x-lzip-compressed-tar"
      "application/x-lzma"
      "application/x-lzma-compressed-tar"
      "application/x-rar"
      "application/x-source-rpm"
      "application/x-sv4cpio"
      "application/x-sv4crc"
      "application/x-tar"
      "application/x-tarz"
      "application/x-tzo"
      "application/x-xar"
      "application/x-xz"
      "application/x-xz-compressed-tar"
      "application/x-zstd-compressed-tar"
      "application/zip"
      "application/zstd"
    ];
    "org.kde.dolphin.desktop" = [
      "inode/directory"
    ];
  };
in {
  xdg = {
    mime.defaultApplications =
      defaults
      |> builtins.mapAttrs (name: value:
        map (mime: {
          name = mime;
          value = name;
        }) value
      )
      |> builtins.attrValues
      |> builtins.concatLists
      |> builtins.listToAttrs;
    icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];
  };
}